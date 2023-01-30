//
//  ScrollBookReading.swift
//  BookDay
//
//  Created by Vivian Bacelar on 27/01/23.
//

import SwiftUI

struct ScrollBookReading: View {
    
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    @State var percent: CGFloat = 0
    @State var numberPage: CGFloat = 0
    //    Pensar em como colocar o número de páginas totais
    @State var totalPage: CGFloat = 0
    
    var body: some View {
        
        TabView(selection: $pageIndex){
            ForEach(pages) {page in
                
                VStack (spacing: 15){
                    
                    Text(page.title)
                        .font(Font.custom("Raleway", size: 18))
                        .multilineTextAlignment(.leading)
                        
                    
                    Text(page.authors)
                        .font(Font.custom("RalewayExtraLight", size: 14))
                        .multilineTextAlignment(.leading)
                    
                    
                    ProgressBar(width: 300, height: 15, percent: percent, color: .corRosa)
                     
                    
                    HStack (spacing: 120) {
  
                        //Descobrir como colocar o número da página que está
                        Text("Page \(Int(numberPage)) (\(Int(totalPage)) )")
                            .font(Font.custom("RalewayExtraLight", size: 12))
                            .foregroundColor(Color.corCinzaEscuro)
                            .multilineTextAlignment(TextAlignment.trailing)
                    
                    }
                    
                    
                    NavigationLink {
                        
                    } label: {
                        Image ("\(page.imageUrl)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 291, height: 433)
                    }

                    
                        
                    if page == pages.last{
                        Button (action: goToZero) {
                            
                        }.buttonStyle(.plain)
                        
                    } else{
                        Button (action: addPage) {
                            
                        }.buttonStyle(.plain)
                        
                    }
                    
                    
                }
                .tag(page.tag)
                
            }
        }
        .animation(.easeInOut, value: pageIndex)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .onAppear{
            dotAppearance.currentPageIndicatorTintColor = UIColor(Color.corRosa)
            dotAppearance.currentPageIndicatorTintColor = UIColor(Color.corCinza)
            dotAppearance.currentPageIndicatorTintColor = UIColor(Color.corCinza)
            
            
        }
        
    }
    
    func addPage() {
        pageIndex += 1
    }
    
    func goToZero() {
        pageIndex = 0
        
    }
}


struct ScrollBookReading_Previews: PreviewProvider {
    static var previews: some View {
        ScrollBookReading()
    }
}
