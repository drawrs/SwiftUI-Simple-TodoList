//
//  TodoInputForm.swift
//  SwiftUI Simple TodoList
//
//  Created by Rizal Hilman on 22/07/23.
//

import SwiftUI

struct TodoInputForm: View {
    // MARK: Core data variables
    @EnvironmentObject var manager: DataManager
    @Environment(\.managedObjectContext) var viewContext
    @State var todo: Todo?
    
    @Binding var isPresented: Bool
    @State private var title: String = ""
    @State private var date: Date = Date()
    @State private var status: TodoStatus = .pending

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter todo title", text: $title)
                } header: {
                    Text("Title")
                }
                
                Section {
                    DatePicker("Select a date", selection: $date, displayedComponents: .date)
                } header: {
                    Text("Date")
                }
                
                Section {
                    Picker("Select status", selection: $status) {
                                            ForEach(TodoStatus.allCases, id: \.self) { status in
                                                Text(status.rawValue)
                                            }
                                        }
                                        .pickerStyle(SegmentedPickerStyle())
                } header: {
                    Text("Status")
                }

            }
            .navigationTitle("New Todo")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        // Save the data and dismiss the sheet
                        self.saveTodo(title: title, date: date, status: status.rawValue)
                        // Call a function to handle saving or further processing of the newTodo
                        // For example, you can pass it to a delegate or callback.
                        isPresented = false
                    }
                }
            }
            .onAppear {
                if let todo = todo {
                    self.title = todo.title!
                    self.date = todo.date!
                    self.status = todo.status! == "completed" ? .completed : .pending
                }
            }
        }
    }

    func saveTodo(title: String, date: Date, status: String) {
        if todo == nil {
            todo = Todo(context: self.viewContext)
            todo?.id = UUID()
        }
        todo?.title = title
        todo?.date = date
        todo?.status = status
        
        do {
            try self.viewContext.save()
            print("Todo saved!")
        } catch {
            print("whoops \(error.localizedDescription)")
        }
    }
}

