//
//  NetworkModel.swift
//  BookDay
//
//  Created by Isabella Gomes  on 25/01/23.
//

import Foundation

class NetworkModel: ObservableObject{
    
    @Published var items: [Item] = []
    
    func fetchBooks() async throws {
        
        var request = URLRequest(url: URL(string: "https://www.googleapis.com/books/v1/volumes?q=flowers+inauthor:keyes&key=AIzaSyBnnuLvW6SMTK3G6VOvwb-36kCr4zW7kvg")!)
        let (data, _) = try await URLSession.shared.data(for: request)
        let bookResponse = try? JSONDecoder().decode(Welcome.self, from: data)
        DispatchQueue.main.async {
            self.items = bookResponse?.items ?? []

        }
        print(items)
    }
    
}
