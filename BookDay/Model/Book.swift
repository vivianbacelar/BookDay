//
//  Book.swift
//  BookDay
//
//  Created by Vivian Bacelar on 24/01/23.
//

import Foundation

//Ele faz várias dessas structs pq na própria api existe uma ordem de organização dos itens.
struct Book: Decodable{
    var items: [BookItem]
}

struct BookItem: Decodable{
    let id: String
    let volumeInfo: VolumeInfo
}

struct VolumeInfo: Decodable {
    let title: String
    let subtitle: String?
    //Como o item de autores tem um Index é fundamental que seja uma array [] para contabilizar se é 0 ou 1.
    let authors: [String]
    let publishedDate: String
    let pageCount: Int
    let language: String
}
