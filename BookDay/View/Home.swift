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
                        .padding(.top, UIScreen.main.bounds.height/25)
                        .padding(.bottom, UIScreen.main.bounds.height/50)
                    
                    Spacer()
                    
                    VStack{
                      
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
