//
//  BlueView.swift
//  BookDay
//
//  Created by Isabella Gomes  on 14/02/23.
//

import SwiftUI
import UserNotifications

struct BlueView: View {
    @Binding  var currentStep: Int
//    var date = Date()
//    @State var timesApplied: Int
    
    var body: some View{
        ZStack{
            Color.corAzul
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                VStack(alignment: .center) {
                    Text("Inform the time you usually read")
                        .font(Font.custom("Raleway", size: 24).weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.corPreto)
                    
//                    Image("testeHora")
//                        .resizable()
//                        .frame(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/25)
                    
                   Notifications()
  
                        Image("dots3")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/120)
                            .multilineTextAlignment(.leading)
                    }.padding(.horizontal, UIScreen.main.bounds.width/4)
                    
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
                        .padding(.top, UIScreen.main.bounds.height/4)
                        .padding(.bottom,UIScreen.main.bounds.height/35)
                }
                .background{
                    Image("imageAzul")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .padding(.trailing, UIScreen.main.bounds.width/300)
                }
            }
        }
    }
    
