//
//  Task+CoreDataProperties.swift
//  TaskList-Take3.0
//
//  Created by Yesha Modi on 2017-02-15.
//  Copyright © 2017 Yesha Modi-300895482. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task");
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var notes: String?
    @NSManaged public var isImportant: Bool
    @NSManaged public var isStatus: Bool

}
