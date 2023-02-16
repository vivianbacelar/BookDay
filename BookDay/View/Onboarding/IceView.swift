//
//  IceView.swift
//  BookDay
//
//  Created by Isabella Gomes  on 14/02/23.
//

import SwiftUI


struct IceView: View {
    @Binding  var currentStep: Int
    @Environment (\.colorScheme) var colorScheme

    var body: some View{
        ZStack{
            Color.corGelo
                .ignoresSafeArea()
            VStack{
                
                Text("Welcome to")
                    .font(Font.custom("Raleway", size: 18).weight(.regular))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.corOn)
                
                Text("BookDay")
                    .font(Font.custom("BelyDisplay-Regular", size: 40))
                    .foregroundColor(Color.corOn)
                    .padding(.bottom,  UIScreen.main.bounds.height/20)
                    .padding(.top, UIScreen.main.bounds.height/200)
                
                Button {
                    self.currentStep += 1
                } label: {
                    Image("startButton")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width/3.5, height: UIScreen.main.bounds.height/22)
                }.buttonStyle(.plain)
                
            }
            .background{
                if colorScheme == .light{
                    Image("imageBookDay")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .padding(.bottom, UIScreen.main.bounds.height/35)
                        .padding(.trailing, UIScreen.main.bounds.width/400)
                }else{
                    Image("imageBookDay")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .padding(.bottom, UIScreen.main.bounds.height/35)
                        .padding(.trailing, UIScreen.main.bounds.width/400)
                        .colorInvert()
                }
            }
            
        }
    }
}
