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
        NavigationView{
            VStack {
                ForEach(items) { item in
                    HStack{
                        AsyncImage(url: item.volumeInfo.imageLinks?.thumbnail) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 200, maxHeight: 150)
                        }placeholder: {
                            Image(systemName: "book")
                        }
                        Text(item.volumeInfo.title ?? "")
                            .font(Font.custom("RalewayRegular", size: 20))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                }
                
                .searchable(text: $networkModel.search)
                
                .onSubmit(of: .search) {
                    Task {
                        do {
                            try await networkModel.fetchBooks()
                        } catch {
                            print(error)
                        }
                    }
                }
                .onChange(of: networkModel.search, perform: performSearch)
                
            }.ignoresSafeArea()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("BookDay")
                    .font(Font.custom("BelyDisplay-Regular", size: 35))
                
                    .padding(.top)
            }
        }.frame(maxWidth: .infinity)
            .background(.white)
        // .toolbarBackground(Color.blue, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        
        
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
