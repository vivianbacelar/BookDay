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
                        .foregroundColor(Color.corPreta)
                        .padding(.top, 40)
                        .padding(.bottom, 40)
                    
                    Spacer()
                    
                    VStack{
//                        
//                        Text("Add New Book")
//                            .font(Font.custom("Raleway", size: 18))
//                            .padding(.top)
//                            .padding(.bottom, 100)
                      
                        ScrollBookReading()
                        
                    }
                }
            }
        }.accentColor(Color.corPreta)
       
        
        
        //                        struct Home_Previews: PreviewProvider {
        //                            static var previews: some View {
        //                                Home(page: Page.samplePage)
        //                            }
        //                        }
    }
}
