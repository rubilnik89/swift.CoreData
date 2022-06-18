//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Roman Zherebko on 18.06.2022.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    enum PredicateParameter: String {
        case beginswith = "BEGINSWITH"
        case beginswithCaseInsensitive = "BEGINSWITH[c]"
        case contains = "CONTAINS"
        case containsCaseInsensitive = "CONTAINS[c]"
    }
    
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }
    
    init(
        filterKey: String,
        filterValue: String,
        predicate: PredicateParameter,
        sort: [SortDescriptor<T>],
        @ViewBuilder content: @escaping (T) -> Content
    ) {
        //USE KEY
//        _fetchRequest = FetchRequest<T>(sortDescriptors: sort, predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        
        //INTERPOLATION
        _fetchRequest = FetchRequest<T>(sortDescriptors: sort, predicate: NSPredicate(format: "\(filterKey) \(predicate.rawValue) %@", filterValue))
        self.content = content
    }
}
