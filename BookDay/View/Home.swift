//
//  HomeView.swift
//  BookDay
//
//  Created by Vivian Bacelar on 25/01/23.
//

import SwiftUI

struct Home: View {
    
    @State private var showingLibrary = false
    @State var percent: CGFloat = 0
    @State var numberPage: CGFloat = 0
    //    Pensar em como colocar o número de páginas totais
    @State var totalPage: CGFloat = 0
    var page: Page
    
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                Color.corGelo
                    .ignoresSafeArea()
                
                
                VStack{
                    
                    Text("BookDay")
                        .font(Font.custom("BelyDisplay-Regular", size: 35))
                    //                        .padding(.top, 60)
                    
                    Text("Add new book")
                        .font(Font.custom("Raleway", size: 20))
                        .multilineTextAlignment(.leading)
                    
                    ProgressBar(width: 300, height: 15, percent: percent, color: .corRosa)
                    //                        .padding(.top, 85)
                    
                    HStack (spacing: 120) {
                        
                        //                        Text("\(Int(percent))%")
                        //                            .font(Font.custom("RalewayExtraLight", size: 10))
                        ////                            .font(.system(size: 10, weight: .light))
                        //                            .multilineTextAlignment(.leading)
                        
                        
                        //Descobrir como colocar o número da página que está
                        Text("Page \(Int(numberPage)) (\(Int(totalPage)) )")
                            .font(Font.custom("RalewayExtraLight", size: 12))
                            .foregroundColor(Color.corCinzaEscuro)
                            .multilineTextAlignment(TextAlignment.trailing)
                        //
                    }
                    
//                    Text(page.title)
//                        .font(Font.custom("Raleway", size: 20))
//                        .multilineTextAlignment(.leading)
//
//                    Text(page.authors)
//                        .font(Font.custom("Raleway", size: 20))
//                        .multilineTextAlignment(.leading)
                   
                    ScrollBookReading()
                    
                }
            }
            
        }
        
        //                struct Home_Previews: PreviewProvider {
        //                    static var previews: some View {
        //                        Home(page: Page.samplePage)
        //                    }
        //                }
    }
}




/*
 
 
 
 Image ("\(page.imageUrl)")
     .resizable()
     .scaledToFit()
     .frame(width: 291, height: 433)
     .background(.red)
 
 // Pensar em como o Reading pode ir para Library, acho que precisa tirar o NavigationLink
 
 Button (action: {showingLibrary = true}) {
     Image("AddNewBook")
         .resizable()
         .frame(width: 291, height: 433)
     
     
 }.buttonStyle(.plain)
 
 NavigationLink("", destination: Library(), isActive: $showingLibrary)
 */
