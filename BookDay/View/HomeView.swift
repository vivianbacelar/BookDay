//
//  HomeView.swift
//  BookDay
//
//  Created by Vivian Bacelar on 25/01/23.
//

import SwiftUI

struct Home: View {
    
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
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
                        .padding(.top, UIScreen.main.bounds.height/45)
                    
//                    Spacer()
                    
                    VStack{
                      
                        ScrollBookReading()
                        
                    }.padding(.bottom)
                }
            }
        }.accentColor(Color.corPreta)
        .fullScreenCover(isPresented: $shouldShowOnboarding, content: {
                OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
            })
       
        
    }
}
