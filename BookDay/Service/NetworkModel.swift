//
//  NetworkModel.swift
//  BookDay
//
//  Created by Isabella Gomes  on 25/01/23.
//

import Foundation

enum NetworkError: Error {
    case badURL
}


@MainActor
class NetworkModel: ObservableObject{
    
    @Published var items: [Item] = []
    @Published var search: String = ""
    var searchEmpty = true
    
    
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
        
        let searched = searching.unaccent()
        if searched != "" {
            searchEmpty = false
        }
        print(searched)
        
        var request = URLRequest(url: URL(string: "https://www.googleapis.com/books/v1/volumes?q=\(searched)")!)
        request.addValue(":keyes&key=AIzaSyBnnuLvW6SMTK3G6VOvwb-36kCr4zW7kvg", forHTTPHeaderField: "Authorization")
        print(request.url!.absoluteString)
        
        guard let url = request.url else {
            throw NetworkError.badURL
        }
        
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
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
