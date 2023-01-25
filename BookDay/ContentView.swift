//
//  ContentView.swift
//  BookDay
//
//  Created by Vivian Bacelar on 24/01/23.
//

import SwiftUI

struct ContentView: View {
    
//   @State private var isPresented = false
//   @State private var isbn: String?
//   @State private var foundBooks: Book?
    
    var body: some View {
        NavigationView{
            Form{
                Section(header:
                            Text("About this book")){
                    Text("Title")
                    Text("Subtitle")
                    Text("Authors")
                }
            }
        }
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
