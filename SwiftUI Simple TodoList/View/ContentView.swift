//
//  ContentView.swift
//  SwiftUI Simple TodoList
//
//  Created by Rizal Hilman on 20/07/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: user typed keyword
    @State var searchKeyword: String = ""
    
    var results: [Todo] {
        return searchKeyword.isEmpty ? todos : todos.filter({ todo in
            todo.title.lowercased().contains(searchKeyword.lowercased())
        })
    }
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(results, id: \.self) { todo in
                    NavigationLink(destination: TodoDetailView(todo: todo)) {
                        HStack(alignment: .center) {
                            VStack(alignment: .leading) {
                                Text(todo.title)
                                    .font(.title3)
                                Text(formatDate(todo.date))
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            StatusIndicator(status: todo.status)
                        }
                    }
                }

            }
            .listStyle(.inset)
            .padding()
            .navigationTitle("Todo List")
            // MARK: Add searchable modifier
            .searchable(text: $searchKeyword)
        }
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
