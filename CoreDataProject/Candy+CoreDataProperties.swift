//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Roman Zherebko on 18.06.2022.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?
    
    public var wrappedName: String {
        name ?? "Unknown"
    }

}

extension Candy : Identifiable {

}
