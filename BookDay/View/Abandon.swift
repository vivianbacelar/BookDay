//
//  Abandon.swift
//  BookDay
//
//  Created by Vivian Bacelar on 09/02/23.
//

import SwiftUI

struct Abandon: View {
    
    @State private var selected = "Want to Read"
    /// Lista que é mostrada de fato
    @State var livros: [Item] = []
    @State var count: Int = 0
    @State var abandonLogic = false
    @State var selectedItem: Item?
    
    var body: some View {
        
        ZStack (alignment: .topTrailing){
            Color.corGelo
                .ignoresSafeArea()
            VStack{
                Text("Abandoned Books")
                    .font(Font.custom("Raleway", size: 20).weight(.bold))
                    .foregroundColor(Color.corPreta)
                    .padding(.top, UIScreen.main.bounds.height/20)
                
                ScrollView() {
                    ZStack {
                        shelfBooks
                        collectionBooks
                    }
                }
            } .padding(.top, UIScreen.main.bounds.height/110)
            
                .overlay(alignment: .topTrailing){
                    Image("teia")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/7)
                        .ignoresSafeArea()
                }
                .background(alignment: .bottomLeading){
                    Image("teia2")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/7)
                        .ignoresSafeArea()
                }
        }
            .overlay(content: {
                if abandonLogic {
                    AbandonLogic(showButtons: $abandonLogic, selectedItem: selectedItem)
                }
            })
        
            .onAppear(){
                livros = getBook(of: selected)
            }.onChange(of: selected) { newValue in
                livros = getBook(of: newValue)
            }
        
    }
    
    
    
    func getBook(of selected: String) -> [Item] {
        if selected == "Want to Read" {
            return DAO.shared.abandonList
        } else {
            return DAO.shared.readList
            
        }
    }
    
    let colums: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var collectionBooks: some View {
        
        VStack {
            LazyVGrid(columns: colums) {
                ForEach(livros, id: \.id) { item in
                    Button {
                        abandonLogic.toggle()
                        selectedItem = item
                    } label: {
                        AsyncImage(url: item.volumeInfo.imageLinks?.thumbnail) { image in
                            image.resizable()
                                .padding(.top)
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 200, maxHeight: 150)
                                .padding(.bottom)
                        } placeholder: {
                            Image("PlaceHolder")
                                .resizable()
                                .padding(.top)
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 200, maxHeight: 150)
                                .padding(.bottom)
                            
                        }
                    }.buttonStyle(.plain)
                        
                }
            }
            Spacer()
        }
    }
    
    var shelfNumber: Int {
        return max(3, Int((livros.count + 2) / 3))
    }
    
    var shelfBooks: some View {
        
        VStack {
            ForEach((1...shelfNumber), id:\.self) { _ in
                Rectangle()
                    .fill(.clear)
                    .frame(width: 310, height: 150)
                
                Rectangle()
                    .fill(Color.corCinzaClaro)
                    .frame(width: 310, height: 8)
            } 
        }
        
    }
}

struct Abandon_Previews: PreviewProvider {
    static var previews: some View {
        Abandon()
    }
}
