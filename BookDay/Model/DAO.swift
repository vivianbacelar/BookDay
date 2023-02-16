//
//  DAO.swift
//  BookDay
//
//  Created by Isabella Gomes  on 30/01/23.
//

import Foundation

// Singleton
class DAO: ObservableObject {
    
    enum List {
        case reading
        case read
        case wantToRead
        case abandon
    }

    static let shared = DAO()
    
    var appData = AppData()
    
    var readingList: [Item] = []
    var wantToReadList: [Item] = []
    var readList: [Item] = []
    var abandonList: [Item] = []
    
    
    func save() {
        appData.saveData()
    }
    
    func load() {
        self.appData = AppData.loadData()
    }
    
    func change(item: Item, from rList: List, to aList: List) {
        add(to: aList, item)
        remove(from: rList, item)
    }
    
    func add(to list: List, _ item: Item ){
        switch list {
        case .read:
           readList.append(item)
        case .reading:
            readingList.append(item)
        case .wantToRead:
          wantToReadList.append(item)
        case .abandon:
          abandonList.append(item)
        }
    }
    
    func remove(from list: List, _ item: Item) {
        
        switch list {
        case .read:
            readList = readList.filter({$0 != item})
        case .reading:
            readingList = readingList.filter({$0 != item})
        case .wantToRead:
            wantToReadList = wantToReadList.filter({$0 != item})
        case .abandon:
          abandonList = abandonList.filter({$0 != item})
        }
    
    }
    
   
    
}

