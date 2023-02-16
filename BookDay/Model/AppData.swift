//
//  AppData.swift
//  BookDay
//
//  Created by Vivian Bacelar on 06/02/23.
//

import Foundation
import CodableExtensions


class AppData: Codable {

    init(){}

    private var wantRead : [Item] = []
    private var reading : [Item] = []
    private var read : [Item] = []
    private var abandon : [Item] = []


    func saveData() {
        self.reading = DAO.shared.readingList
        self.read = DAO.shared.readList
        self.wantRead = DAO.shared.wantToReadList
        self.abandon = DAO.shared.abandonList
        
        do {
            try self.save()
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    
    
    static func loadData() -> AppData {
        guard let loaded = (try? AppData.load()) else {return AppData()}
        
        DAO.shared.readingList = loaded.reading
        DAO.shared.wantToReadList = loaded.wantRead
        DAO.shared.readList = loaded.read
        DAO.shared.abandonList = loaded.abandon
        
        return loaded
    }
}
