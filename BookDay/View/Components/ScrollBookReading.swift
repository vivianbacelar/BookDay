//
//  ScrollBookReading.swift
//  BookDay
//
//  Created by Vivian Bacelar on 27/01/23.
//

import SwiftUI

struct ScrollBookReading: View {
    
    @State private var ItemIndex = 0
    private let dotAppearance = UIPageControl.appearance()
    @State var percent: CGFloat = 0
    @State var numberPage: CGFloat = 0
    //    Pensar em como colocar o número de páginas totais
    @State var totalPage: CGFloat = 0
    @State var livros: [Item] = DAO.shared.readingList
    
    
    var body: some View {
      
            TabView(selection: $ItemIndex){
                
                ForEach(livros, id: \.id) { page in
                    VStack (spacing: 20){
                        
                        Text(page.volumeInfo.title)
                            .font(Font.custom("Raleway", size: 20))
                            .multilineTextAlignment(.leading)
                        
                        Text(page.volumeInfo.authors?.first ?? "")
                            .font(Font.custom("Raleway", size: 20))
                            .multilineTextAlignment(.leading)
                        
                        ProgressBar(width: 300, height: 15, percent: percent, color: .corRosa)
                        
                        Text("Page \(Int(numberPage)) (\(Int(totalPage)) )")
                            .font(Font.custom("RalewayExtraLight", size: 12))
                            .foregroundColor(Color.corCinzaEscuro)
                            .multilineTextAlignment(TextAlignment.trailing)
                        
                        NavigationLink {
                            InfoBookView(item: page)
                        } label: {
                            AsyncImage(url: page.volumeInfo.imageLinks?.thumbnail){ image in
                                image.resizable()
                                    .scaledToFit()
                                    .frame(width: 291, height: 433)
                            } placeholder: {
                                Image("PlaceHolder")
                                    .resizable()
                                    .padding(.top)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 200, maxHeight: 150)
                                    .padding(.bottom)
                            }
                        }
                        .buttonStyle(.plain)
                        
                        
                        //                        button
                    }
                    // .tag(page.volumeInfo.)
                }
                
            }
            .animation(.easeInOut, value: ItemIndex)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .onAppear{
                
                //TODO: melhorar, entender DAO no SwiftUI
                // depois explicar pro pg
                livros = DAO.shared.readingList
                dotAppearance.currentPageIndicatorTintColor = UIColor(Color.corRosa)
                dotAppearance.currentPageIndicatorTintColor = UIColor(Color.corCinza)
                dotAppearance.currentPageIndicatorTintColor = UIColor(Color.corCinza)
                
                
            }
  
    }
    
    //    var button: some View {
    //
    //        VStack {
    //            if page == (livros.last) {
    //                Button (action: goToZero) {
    //
    //                }.buttonStyle(.plain)
    //
    //            } else{
    //                Button (action: addPage) {
    //
    //                }.buttonStyle(.plain)
    //
    //            }
    //        }
    //    }
    //
    //    func addPage() {
    //        ItemIndex += 1
    //    }
    //
    //    func goToZero() {
    //        ItemIndex = 0
    //
    //
    //    }
    //}
}

struct ScrollBookReading_Previews: PreviewProvider {
    static var previews: some View {
        ScrollBookReading()
    }
}