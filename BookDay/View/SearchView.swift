//
//  SearchView.swift
//  BookDay
//
//  Created by Isabella Gomes  on 25/01/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var search: String = ""
    @State private var filteredItems: [Item] = []
    @StateObject private var networkModel = NetworkModel()
    
 
    var body: some View {
        NavigationStack{
            VStack {
                List(networkModel.items) { item in
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
                .searchable(text: $search)
                .onChange(of: search, perform: performSearch)
                .task {
                    do {
                       try await networkModel.fetchBooks()
                    } catch {
                        print(error)
                    }
                    
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
