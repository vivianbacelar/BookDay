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
            ScrollView {
                
                
                VStack {
                    ForEach(items) { item in
                        VStack {
                            HStack {
                                AsyncImage(url: item.volumeInfo.imageLinks?.thumbnail) { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 200, maxHeight: 150)
                                } placeholder: {
                                    Image(systemName: "book")
                                }
                                VStack{
                                    Text(item.volumeInfo.title)
                                        .font(Font.custom("RalewayRegular", size: 20))
                                        .multilineTextAlignment(.leading)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    //                                Text(item.volumeInfo.authors)
                                    //                                    .font(Font.custom("RalewayLight", size: 20))
                                    //                                    .multilineTextAlignment(.leading)
                                    //                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    HStack {
                                        Spacer()
                                        Button {
                                            print("Click")
                                        }label: {
                                            Image(systemName: "plus.circle")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 30)
                                                .foregroundColor(.pink)
                                                .padding(.trailing)
                                            //.padding(.horizontal)
                                        }.buttonStyle(.plain)
                                    }
                                    
                                }
                            }
                            RoundedRectangle(cornerRadius: 15)
                                   .foregroundColor(Color.gray)
                                   .frame(height: 1)
                                   .padding(.horizontal, 30)
                        }
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
                
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("BookDay")
                        .font(Font.custom("BelyDisplay-Regular", size: 35))
                        .padding(.top,50)
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
