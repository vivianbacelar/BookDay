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
                .foregroundColor: UIColor(named: "corpreto")!
            ], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(
            [
                .font: UIFont(name: "Raleway", size: 18)!.regular,
                .foregroundColor: UIColor(named: "corcinzaMaisEscuro")!
            ], for: .normal)
        
    }
    
    
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                Color.corGelo
                    .ignoresSafeArea()
                
                VStack{
                   
                    Text("BookDay")
                        .font(Font.custom("BelyDisplay-Regular", size: 23))
                        .foregroundColor(Color.corPreta)
                        .padding(.top, UIScreen.main.bounds.height/25)
                    
                        
                    
                    Picker("", selection: $selected){
                        Text("Want to Read")
                            .font(Font.custom("Raleway", size: 18))
                            .tag("Want to Read")
                        
                        Text("Already Read")
                            .font(Font.custom("Raleway", size: 18))
                            .tag("Read")
                    }
                    .pickerStyle(.segmented)
                    .frame(width: UIScreen.main.bounds.width/1.2)
                    .padding(.top, UIScreen.main.bounds.height/20)
                    
                    ScrollView() {
                        ZStack {
                            shelfBooks
                            collectionBooks
                        }
                    }.padding(.horizontal, UIScreen.main.bounds.width/1.2)
                    
                }
                .overlay{
                        NavigationLink {
                            Abandon()
                        } label: {
                            Image("trash")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width/14.5, height: UIScreen.main.bounds.height/25)
                                
                            
                        }.padding(.bottom, UIScreen.main.bounds.height/1.38)
                        .padding(.leading, UIScreen.main.bounds.width/1.3)
                        
            }
                
                    
              
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
            
            
        } .accentColor(Color.corPreta)
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
    @Environment(\.colorScheme) var colorScheme
    var shelfBooks: some View {
        
        VStack {
            
            if livros.count == 0 {
                if colorScheme == .light {
                    Image("libraryEmpty")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
                        .padding(.vertical, UIScreen.main.bounds.height/18)
                } else {
                    Image("libraryEmpty")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
                        .padding(.vertical, UIScreen.main.bounds.height/18)
                        .colorInvert()
                }
            } else {
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
}
