//
//  BlueView.swift
//  BookDay
//
//  Created by Isabella Gomes  on 14/02/23.
//

import SwiftUI

struct BlueView: View {
    @Binding  var currentStep: Int
    
    var body: some View{
        ZStack{
            Color.corAzul
                .ignoresSafeArea()
           
            VStack{
                Spacer()
                VStack(alignment: .center){
                    Text("Inform the time you usually read")
                        .font(Font.custom("Raleway", size: 24).weight(.semibold))
                        .multilineTextAlignment(.leading)
                    
                    Image("testeHora")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/25)
                    
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
        }
    }
}
