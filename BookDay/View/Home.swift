//
//  HomeView.swift
//  BookDay
//
//  Created by Vivian Bacelar on 25/01/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        NavigationView{
            
            ZStack{
                Color.corGelo
                    .ignoresSafeArea()
                
                Image("Logo")
                    .padding(.bottom, 600)
                
                VStack{
                    Text("Add new book")
                        .multilineTextAlignment(.leading)
                    
                    VStack{
                        
                        RoundedRectangle(cornerRadius: 10)
                            .shadow(radius: 1, y: 2)
                            .frame(width: 350, height: 550)
                            .padding(.top, 100)
                        //                        .backgroundColor(.nil)
                        
                        
                        
                    }
                    
                }
            }
            
        }
//        
//        struct Home_Previews: PreviewProvider {
//            static var previews: some View {
//                Home()
//            }
//        }
    }
}
