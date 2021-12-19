//
//  ItemTable+CoreDataProperties.swift
//  ToDoList1
//
//  Created by admin on 18/12/2021.
//
//

import Foundation
import CoreData


extension ItemTable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemTable> {
        return NSFetchRequest<ItemTable>(entityName: "ItemTable")
    }

    @NSManaged public var title1: String?
    @NSManaged public var desc1: String?
    @NSManaged public var date1: String?

}

extension ItemTable : Identifiable {

}
