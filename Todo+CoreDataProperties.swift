//
//  Todo+CoreDataProperties.swift
//  SwiftUI Simple TodoList
//
//  Created by Rizal Hilman on 22/07/23.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var date: Date?
    @NSManaged public var status: String?

}

extension Todo : Identifiable {

}
