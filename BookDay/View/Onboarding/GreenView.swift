//
//  GreenView.swift
//  BookDay
//
//  Created by Isabella Gomes  on 14/02/23.
//

import SwiftUI
import UserNotifications

struct GreenView: View {
    @Binding  var currentStep: Int
    
    var body: some View{
        
        ZStack{
            Color.corVerde
                .ignoresSafeArea()

            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text("Enable the notification for us to help you keep up with your schedule.")
                            .font(Font.custom("Raleway", size: 24).weight(.semibold))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.corPreto)
                        Image("dots4")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/120)
                            .multilineTextAlignment(.leading)
                    }.padding(.bottom)
                     
                    Rectangle()
                        .foregroundColor(Color.corVerde)
                        .frame(width: UIScreen.main.bounds.width/6, height: UIScreen.main.bounds.height/10)
                    
                }.padding(.horizontal, UIScreen.main.bounds.width/15)
                    .padding(.top, UIScreen.main.bounds.height/12)
                
              
                    
                
                HStack(alignment: .bottom){
                    Spacer()
                    
                    Button {
                        self.currentStep += 1
                    } label: {
                        Image("nextButton")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width/4.5, height: UIScreen.main.bounds.height/25)
                        
                    }.buttonStyle(.plain)
                    
                }.padding(.horizontal, UIScreen.main.bounds.width/10)
                    .padding(.top, UIScreen.main.bounds.height/1.91)

            }
            .background{
                Image("imageVerde")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//                    .padding(.trailing, UIScreen.main.bounds.width/10)
                
               
            }
        }
    }
}
