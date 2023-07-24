//
//  ContentView.swift
//  SwiftUI Simple TodoList
//
//  Created by Rizal Hilman on 20/07/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager: DataManager
    @Environment(\.managedObjectContext) var viewContext
    
    // MARK: user typed keyword
    @State var searchKeyword: String = ""
    @State var isSheetPresented: Bool = false
    @FetchRequest(sortDescriptors: []) private var todos: FetchedResults<Todo>
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todos, id: \.self) { todo in
                    NavigationLink(destination: TodoDetailView(todo: todo)) {
                        HStack(alignment: .center) {
                            VStack(alignment: .leading) {
                                Text(todo.title ?? "")
                                    .font(.title3)
                                Text(formatDate(todo.date ?? Date()))
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            StatusIndicator(status: todo.status == "completed" ? .completed : .pending)
                        }
                    }
                }
                .onDelete(perform: delete)
            }
            .listStyle(.inset)
            .padding()
            .navigationTitle("Todo List")
            // MARK: Add searchable modifier
            .searchable(text: $searchKeyword)
            .onChange(of: searchKeyword) { newValue in
                self.todos.nsPredicate = newValue.isEmpty ? nil : NSPredicate(format: "title CONTAINS %@", newValue)
            }
            .sheet(isPresented: $isSheetPresented, content: {
                TodoInputForm(isPresented: $isSheetPresented)
            })
            
            .toolbar {
                Button("Add") {
                    isSheetPresented.toggle()
                }
            }
        }
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    private func delete(at offsets: IndexSet) {
        for index in offsets {
            let todo = todos[index]
            self.viewContext.delete(todo)
            do {
                try viewContext.save()
                print("perform delete")
            } catch {
                // handle the Core Data error
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
