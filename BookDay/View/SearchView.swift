//
//  SearchView.swift
//  BookDay
//
//  Created by Isabella Gomes  on 25/01/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var filteredItems: [Item] = []
    @StateObject private var networkModel = NetworkModel()
    
    private var items: [Item]{
        filteredItems.isEmpty ? networkModel.items: filteredItems
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                Button {
                    Task {
                        do {
                            try await networkModel.fetchBooks()
                        } catch {
                            print(error)
                        }
                    }
                    
                } label: {
                    Text("pt-br")
                }
                List(items) { item in
                    HStack{
                        AsyncImage(url: item.volumeInfo.imageLinks?.smallThumbnail) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 100, maxHeight: 100)
                        }placeholder: {
                            Text("loading...")
                        }
                        Text(item.volumeInfo.title ?? "")
                        
                        
                    }
                }
                .searchable(text: $networkModel.search)
                .onChange(of: networkModel.search, perform: performSearch)
                .task {
                    do {
                        try await networkModel.fetchBooks()
                    } catch {
                        print(error)
                    }
                    //game+of+trhones
                }
            }
        }
    }
    
    private func performSearch (keyWord: String) {
        filteredItems = networkModel.items.filter{ item in
            item.volumeInfo.title.contains(keyWord)
        }
    }
 
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SearchView()
        }
    }
}
