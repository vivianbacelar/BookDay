//
//  PurpleView.swift
//  BookDay
//
//  Created by Isabella Gomes  on 14/02/23.
//

import SwiftUI

struct PurpleView: View {
    @Binding  var currentStep: Int
    
    var body: some View{
        ZStack{
            Color.corRoxo
                .ignoresSafeArea()

            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text("To start off, let's learn about your reading schedule.")
                            .font(Font.custom("Raleway", size: 24).weight(.semibold))
                            .multilineTextAlignment(.leading)
                        Image("dots2")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/120)
                            .multilineTextAlignment(.leading)
                    }.padding(.bottom)
                     
                    Rectangle()
                        .foregroundColor(Color.corRoxo)
                        .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/10)
                    
                }.padding(.horizontal, UIScreen.main.bounds.width/15)
                    .padding(.top, UIScreen.main.bounds.height/12)
                    
                
                HStack(alignment: .bottom){
                    Button {
                        self.currentStep = 4
                    } label: {
                        Text("Skip")
                            .font(Font.custom("Raleway", size: 15).weight(.medium))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.corOn)
                    }.buttonStyle(.plain)
                    
                    Spacer()
                    
                    Button {
                        self.currentStep += 1
                    } label: {
                        Image("nextButton")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width/4.5, height: UIScreen.main.bounds.height/25)
                        
                    }.buttonStyle(.plain)
                    
                }.padding(.horizontal, UIScreen.main.bounds.width/10)
                    .padding(.top, UIScreen.main.bounds.height/1.8)

            }
            .background{
                Image("imageRoxo")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//                    .padding(.trailing, UIScreen.main.bounds.width/10)
            }
        }
    }
}
