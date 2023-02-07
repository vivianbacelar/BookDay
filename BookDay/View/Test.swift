//
//  Test.swift
//  BookDay
//
//  Created by Vivian Bacelar on 07/02/23.
//

//import Foundation
//
//struct ContentView: View {
//    @State private var contacts = [
//        "John",
//        "Alice",
//        "Bob",
//        "Foo",
//        "Bar"
//    ]
//    @State var livros: [Item] = []
//
//    var body: some View {
//        // 1
//        NavigationView {
//
//            List {
//                ForEach(contacts, id: \.self) { contact in
//                    Text(contact)
//                }.onDelete { indexSet in
//                    livros.remove(atOffsets: indexSet)
//                }
//            }
//            .toolbar {
//                // 2
//                EditButton()
//                
//                    .onAppear(){
//                        livros = getBook(of: selected)
//
//            }
//        }
//    }
//        func removeItem (at offsets: IndexSet){
//            if  selectedItem.toggle{
//                selectedItem.remove(atoffsets: offset)
//        }
//}
