//
//  ScrollBookReading.swift
//  BookDay
//
//  Created by Vivian Bacelar on 27/01/23.
//

import SwiftUI

struct ScrollBookReading: View {
    @ObservedObject var selectionVM: SelectionVM = SelectionVM.shared
    @State private var ItemIndex = 0
    private let dotAppearance = UIPageControl.appearance()
    @State var percent: CGFloat = 0
    @State var numberPage: CGFloat = 0
    //    Pensar em como colocar o número de páginas totais
    @State var totalPage: CGFloat = 0
    @State var livros: [Item] = DAO.shared.readingList
    //    @Binding var show: Bool
    @State var countPage: String =
    UserDefaults.standard.string(forKey: UserDefaultsKeys.countPage.rawValue) ?? "0"
    
//    items.append("AddNewBook")
    
    
    var body: some View {
      
            TabView(selection: $ItemIndex){
                
                ForEach(livros, id: \.id) { page in
                    
                    VStack (alignment: .leading){
                        Text(page.volumeInfo.title)
                            .font(Font.custom("Raleway", size: 20).weight(.bold))
                            .foregroundColor(Color.corPreta)
                            .padding(.bottom, UIScreen.main.bounds.height/120)
                        
                        Text(page.volumeInfo.authors?.first ?? "")
                            .font(Font.custom("Raleway", size: 15).weight(.regular))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.corPreta)
                            .padding(.bottom, UIScreen.main.bounds.height/120)
                        
                        
                        VStack{
                            
//                            Text("Page \(Int(numberPage)) (\(Int(totalPage)))")
//                                .font(Font.custom("RalewayExtraLight ", size: 12))
//                                .foregroundColor(Color.corCinzaEscuro)
//                                .multilineTextAlignment(TextAlignment.trailing)
                            
                            
                            NavigationLink {
                                InfoBookView(item: page, countPage: $countPage)
                            } label: {
                                VStack{
                                    AsyncImage(url: page.volumeInfo.imageLinks?.thumbnail){ image in
                                        image.resizable()
                                            .frame(width: UIScreen.main.bounds.width/1.4, height: UIScreen.main.bounds.height/2)
                                    } placeholder: {
                                        Image("PlaceHolder")
                                            .resizable()
                                            .frame(width: UIScreen.main.bounds.width/1.4, height: UIScreen.main.bounds.height/2)
                                    }
                                }
                            }.buttonStyle(.plain)
                        }
                        
                        if page == (livros.last)! {
                            Button (action: goToZero) {
                                
                            }.buttonStyle(.plain)
                            
                        } else {
                            Button (action: addPage) {
                           
                        }.buttonStyle(.plain)
                    }
                }
                    .padding(.horizontal, UIScreen.main.bounds.width/10)
                .tag(page.volumeInfo)
            }
                
                Button {
                    print("add")
                    selectionVM.selection = 3
                } label: {
                    Image("AddNewBook")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width/1.4, height: UIScreen.main.bounds.height/2)
                }

        }
        .animation(.easeInOut, value: ItemIndex)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .onAppear{
            
            //TODO: melhorar, entender DAO no SwiftUI
            // depois explicar pro pg
            livros = DAO.shared.readingList
            dotAppearance.currentPageIndicatorTintColor = UIColor(Color.corRosa)
            dotAppearance.currentPageIndicatorTintColor = UIColor(Color.corCinza)
            dotAppearance.currentPageIndicatorTintColor = UIColor(Color.corCinza)
        }
    }
    func addPage() {
        ItemIndex += 1
    }
    
    func goToZero() {
        ItemIndex = 0
    }
}
