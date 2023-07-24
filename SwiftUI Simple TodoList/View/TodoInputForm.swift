//
//  TodoInputForm.swift
//  SwiftUI Simple TodoList
//
//  Created by Rizal Hilman on 22/07/23.
//

import SwiftUI

struct TodoInputForm: View {
    
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
                        
                        // Call a function to handle saving or further processing of the newTodo
                        // For example, you can pass it to a delegate or callback.
                        isPresented = false
                    }
                }
            }
        }
    }

}

