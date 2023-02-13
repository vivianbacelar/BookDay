//
//  LibraryView.swift
//  BookDay
//
//  Created by Vivian Bacelar on 25/01/23.


import SwiftUI
extension UIFont {
    var bold: UIFont { return withWeight(.bold) }
    var semibold: UIFont { return withWeight(.semibold) }
    var medium: UIFont { return withWeight(.medium) }
    var regular: UIFont { return withWeight(.regular) }
    var light: UIFont { return withWeight(.light) }
    
    private func withWeight(_ weight: UIFont.Weight) -> UIFont {
        var attributes = fontDescriptor.fontAttributes
        var traits = (attributes[.traits] as? [UIFontDescriptor.TraitKey: Any]) ?? [:]
        
        traits[.weight] = weight
        
        attributes[.name] = nil
        attributes[.traits] = traits
        attributes[.family] = familyName
        
        let descriptor = UIFontDescriptor(fontAttributes: attributes)
        
        return UIFont(descriptor: descriptor, size: pointSize)
    }
}
struct Library: View {
    
    @State private var selected = "Want to Read"
    /// Lista que é mostrada de fato
    @State var livros: [Item] = []
    @State var count: Int = 0
    @State var changePages = false
    @State var selectedItem: Item?
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "cinzaClaro")
        UISegmentedControl.appearance().setTitleTextAttributes(
            [
                .font: UIFont(name: "Raleway", size: 18)!.regular,
                .foregroundColor: UIColor(named: "preto")!
            ], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(
            [
                .font: UIFont(name: "Raleway", size: 18)!.regular,
                .foregroundColor: UIColor(named: "cinzaMaisEscuro")!
            ], for: .normal)
        
    }
    
    
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                Color.corGelo
                    .ignoresSafeArea()
                
                VStack{
                    Spacer()
                    
                    //                    HStack{
                    
                    Text("BookDay")
                        .font(Font.custom("BelyDisplay-Regular", size: 23))
                        .foregroundColor(Color.corPreta)
                        .padding(.top, UIScreen.main.bounds.height/32.8)
                        .padding(.bottom, UIScreen.main.bounds.height/50)
                    
                    //                            .toolbar{
                    //
                    //                                ToolbarItem(placement: .navigationBarTrailing) {
                    //                                    NavigationLink {
                    //                                        Abandon()
                    //                                    } label: {
                    //                                        Image("trash")
                    ////                                            .padding(.top)
                    ////                                            .padding(.trailing)
                    //
                    //
                    //                                    }
                    //                                }
                    //                            }
                    //                    }
                    
                    Picker("", selection: $selected){
                        Text("Want to Read")
                            .font(Font.custom("Raleway", size: 18))
                            .tag("Want to Read")
                        
                        Text("Read")
                            .font(Font.custom("Raleway", size: 18))
                            .tag("Read")
                    }
                    .pickerStyle(.segmented)
                    .frame(width: UIScreen.main.bounds.width/1.4)
                    .padding(.top, UIScreen.main.bounds.height/20)
                    
                    ScrollView() {
                        ZStack {
                            shelfBooks
                            collectionBooks
                        }
                    }
                    
                }.padding(.horizontal, UIScreen.main.bounds.width/2)
            }
            .overlay(content: {
                if changePages {
                    ChangePages(showChanges: $changePages, selectedItem: selectedItem)
                }
            })
            .onAppear(){
                livros = getBook(of: selected)
            }.onChange(of: selected) { newValue in
                livros = getBook(of: newValue)
            }
            
        }
        
    }
    
    
    
    
    func getBook(of selected: String) -> [Item] {
        if selected == "Want to Read" {
            return DAO.shared.wantToReadList
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
                        changePages.toggle()
                        selectedItem = item
                    } label: {
                        AsyncImage(url: item.volumeInfo.imageLinks?.thumbnail) { image in
                            image.resizable()
                                .padding(.top)
                                .frame(maxWidth: UIScreen.main.bounds.width/4.5, maxHeight: UIScreen.main.bounds.height/6)
                                .padding(.bottom)
                        } placeholder: {
                            Image("PlaceHolder")
                                .resizable()
                                .padding(.top)
                                .frame(maxWidth: UIScreen.main.bounds.width/4.5, maxHeight: UIScreen.main.bounds.height/6)
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
                    .frame(width: UIScreen.main.bounds.width/1.3, height: UIScreen.main.bounds.height/6)
                
                Rectangle()
                    .fill(Color.corCinzaClaro)
                    .frame(width: UIScreen.main.bounds.width/1.3, height: UIScreen.main.bounds.height/99)
            }
        }
        
    }
}
