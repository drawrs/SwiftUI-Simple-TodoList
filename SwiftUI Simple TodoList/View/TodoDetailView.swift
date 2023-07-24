//
//  TodoDetailView.swift
//  SwiftUI Simple TodoList
//
//  Created by Rizal Hilman on 20/07/23.
//

import SwiftUI

struct TodoDetailView: View {
    @State var isShowingEditForm: Bool = false
    
    var todo: Todo

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(todo.title ?? "")
                .font(.title)
            Text(formatDate(todo.date ?? Date()))
                .font(.subheadline)
                .foregroundColor(.gray)
            StatusIndicator(status: todo.status == "completed" ? .completed : .pending)
        }
        .padding()
        .navigationTitle("Todo Details")
        .toolbar {
            Button("Edit") {
                isShowingEditForm.toggle()
            }
        }
        .sheet(isPresented: $isShowingEditForm) {
            TodoInputForm(todo: todo, isPresented: $isShowingEditForm)
        }
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
