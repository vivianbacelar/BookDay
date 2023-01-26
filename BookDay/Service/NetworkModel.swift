//
//  NetworkModel.swift
//  BookDay
//
//  Created by Isabella Gomes  on 25/01/23.
//

import Foundation

@MainActor
class NetworkModel: ObservableObject{
    
    @Published var items: [Item] = []
    @Published var search: String = ""
    func fetchBooks() async throws {
        
        var request = URLRequest(url: URL(string: "https://www.googleapis.com/books/v1/volumes?q=\(search)")!)
        request.addValue(":keyes&key=AIzaSyBnnuLvW6SMTK3G6VOvwb-36kCr4zW7kvg", forHTTPHeaderField: "Authorization")
        print(request.url!.absoluteString)
        
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        var bookResponse: Welcome?
        do {
            bookResponse = try JSONDecoder().decode(Welcome.self, from: data)
        } catch let err {
            print(err)
        }
        
        DispatchQueue.main.async {
            self.items = bookResponse?.items ?? []
        }
        print(items)
    }
    
}
