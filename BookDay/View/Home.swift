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
                        .font(Font.custom("BelyDisplay-Regular", size: 23))
                        .padding(.top, 30)
                    
 
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
