//
//  PageModel.swift
//  BookDay
//
//  Created by Vivian Bacelar on 27/01/23.
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var title: String
    var authors: String
    var description: String
    var imageUrl: String
    var progress: Int
    var tag: Int
    
    static var samplePage = Page(title: "", authors: "", description: "", imageUrl: "", progress: 0, tag: 0)
    
    static var samplePages: [Page] = [
        Page(title: "Pachinko", authors: "Min Jin Lee",  description: "", imageUrl: "Pachinko", progress: 0, tag: 0),
    Page(title: "Daisy Jones & The Six", authors: "Taylor Jenkins",  description: "They were lovers and friends and brothers and rivals. They couldn't believe their luck, until it ran out.\n This is their story of the early days and the wild nights, but everyone remembers\n the truth differently. The only thing they all know for sure is that from the moment\n Daisy Jones walked barefoot onstage at the Whisky, their\n lives were irrevocably changed. Making music is never\n just about the music. And sometimes it can be hard to tell where the\n sound stops and the feelings begin.", imageUrl: "Daisy", progress: 0, tag: 1),
    Page(title: "Verity", authors: "Collen Hoover",  description: "", imageUrl: "Verity", progress: 0, tag: 2),
        Page(title: "", authors: "", description: "", imageUrl: "AddNewBook", progress: 0, tag: 3),
    ]
}
