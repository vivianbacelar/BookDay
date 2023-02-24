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
    @State var livros: [Item] = DAO.shared.readingList
    //    @Binding var show: Bool
//    @State var item: Item

//    var percentage: Double
    
    
    
    var body: some View {
      
            TabView(selection: $ItemIndex){
                
                ForEach(Array(livros.enumerated()), id: \.offset) { index, page in
                    
                    VStack (alignment: .leading){
                        VStack(alignment: .leading){
                            Text(page.volumeInfo.title)
                                .font(Font.custom("Raleway", size: 20).weight(.bold))
                                .foregroundColor(Color.corPreta)
                                .padding(.bottom, UIScreen.main.bounds.height/120)
                            
                            Text(page.volumeInfo.authors?.first ?? "")
                                .font(Font.custom("Raleway", size: 15).weight(.regular))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.corPreta)
                                .padding(.bottom, UIScreen.main.bounds.height/120)
                        }.padding(.leading, UIScreen.main.bounds.width/15)
                        
                        VStack (alignment: .center){
                            ProgressBarView(progress: calPercentage(item: page))
                        }
                        VStack {
                            
                            NavigationLink {
                                InfoBookView(item: page)
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
                        }.padding(.leading, UIScreen.main.bounds.width/8)
                        
                        
                        if page == (livros.last)! {
                            Button (action: goToZero) {
                                
                            }.buttonStyle(.plain)
                            
                        } else {
                            Button (action: addPage) {
                           
                        }.buttonStyle(.plain)
                    }
                }
                    .padding(.horizontal, UIScreen.main.bounds.width/10)
                .tag(index)
            }
                VStack{
                    
                    Text("Add new book")
                        .font(Font.custom("Raleway", size: 20).weight(.regular))
                        .foregroundColor(Color.corPreta)
                        .padding(.bottom, UIScreen.main.bounds.height/20)
                    Button {
                        print("add")
                        selectionVM.selection = 3
                    } label: {
                        Image("AddNewBook")
                            .resizable()
                            .frame(maxWidth: 291, maxHeight: 433)
                    }.buttonStyle(.plain)
                    
                    .tag(livros.count)
                } .padding(.top, UIScreen.main.bounds.height/30)

        }
        .animation(.easeInOut, value: ItemIndex)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .onAppear{
            
            //TODO: melhorar, entender DAO no SwiftUI
            // depois explicar pro pg
            livros = DAO.shared.readingList
            dotAppearance.currentPageIndicatorTintColor = UIColor(Color.corRosa)
            dotAppearance.pageIndicatorTintColor = UIColor(Color.corFundo)
        }
    }
    func addPage() {
        ItemIndex += 1
    }
    
    func goToZero() {
        ItemIndex = 0
    }
    
    func calPercentage(item: Item) -> Double {
        var percentage = ((Double(item.countPage ?? "0.0") ?? 0.0) * 100) / (Double(item.volumeInfo.pageCount ?? 100))
        print(item.countPage)
        return percentage
       
    }
}
