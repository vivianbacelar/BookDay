//
//  DAO.swift
//  BookDay
//
//  Created by Isabella Gomes  on 30/01/23.
//

import Foundation

// Singleton
class DAO: ObservableObject {

    static let shared = DAO()
    
    var appData = AppData()
    
    var readingList: [Item] = []
    var wantToReadList: [Item] = []
    var readList: [Item] = []

    
    func addToReadingList(item: Item) {
        readingList.append(item)
    }
    
    func addToWantList(item: Item){
        wantToReadList.append(item)
    }
    
    func addToReadList(item: Item){
        readList.append(item)
    }
    
    func save() {
        appData.saveData()
    }
    
    func load() {
        self.appData = AppData.loadData()
    }
}

