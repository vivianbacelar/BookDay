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
    @Published var search: String = "Game of Thrones"
    
    
    func fetchBooks() async throws {
        var searching: String = ""
        var count = 0
        while count < search.count {
            if String(search[count]) == " " {
                searching += "+"
            }
            else {
                searching += String(search[count])
            }
            count += 1
        }
        
        
        var request = URLRequest(url: URL(string: "https://www.googleapis.com/books/v1/volumes?q=\(searching)")!)
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
