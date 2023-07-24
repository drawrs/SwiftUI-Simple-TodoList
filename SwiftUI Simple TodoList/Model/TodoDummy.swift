//
//  Todo.swift
//  SwiftUI Simple TodoList
//
//  Created by Rizal Hilman on 20/07/23.
//

import Foundation

enum TodoStatus: String, CaseIterable {
    case pending
    case completed
}

struct TodoDummy: Identifiable, Hashable {
    let id: Int
    let title: String
    let date: Date
    var status: TodoStatus
}

// Helper function to create Date instances from components
func createDate(year: Int, month: Int, day: Int, hour: Int, minute: Int) -> Date {
    var components = DateComponents()
    components.year = year
    components.month = month
    components.day = day
    components.hour = hour
    components.minute = minute
    components.timeZone = TimeZone.current
    let calendar = Calendar.current
    return calendar.date(from: components)!
}

// Sample data
let todos: [TodoDummy] = [
    TodoDummy(id: 1, title: "Buy groceries", date: createDate(year: 2023, month: 7, day: 20, hour: 9, minute: 0), status: .pending),
    TodoDummy(id: 2, title: "Finish homework", date: createDate(year: 2023, month: 7, day: 21, hour: 15, minute: 30), status: .pending),
    TodoDummy(id: 3, title: "Call mom", date: createDate(year: 2023, month: 7, day: 22, hour: 12, minute: 0), status: .pending),
    TodoDummy(id: 4, title: "Go for a run", date: createDate(year: 2023, month: 7, day: 23, hour: 7, minute: 0), status: .pending),
    TodoDummy(id: 5, title: "Read a book", date: createDate(year: 2023, month: 7, day: 19, hour: 18, minute: 0), status: .completed),
    TodoDummy(id: 6, title: "Write a blog post", date: createDate(year: 2023, month: 7, day: 18, hour: 20, minute: 0), status: .completed),
    TodoDummy(id: 7, title: "Attend a meeting", date: createDate(year: 2023, month: 7, day: 25, hour: 10, minute: 0), status: .pending),
    TodoDummy(id: 8, title: "Clean the house", date: createDate(year: 2023, month: 7, day: 17, hour: 14, minute: 0), status: .completed),
    TodoDummy(id: 9, title: "Practice playing guitar", date: createDate(year: 2023, month: 7, day: 26, hour: 16, minute: 0), status: .pending),
    TodoDummy(id: 10, title: "Plan a trip", date: createDate(year: 2023, month: 7, day: 27, hour: 11, minute: 30), status: .pending)
]

