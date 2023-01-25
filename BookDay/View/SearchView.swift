//
//  SearchView.swift
//  BookDay
//
//  Created by Isabella Gomes  on 25/01/23.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var networkModel = NetworkModel()
 
    var body: some View {
        NavigationStack{
            VStack {
                List(networkModel.items) { item in
                    Text(item.volumeInfo.title ?? "")
                }.task {
                    do {
                       try await networkModel.fetchBooks()
                    } catch {
                        print(error)
                    }
                    
                }
            }
        }
    }
 
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
