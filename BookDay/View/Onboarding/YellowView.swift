//
//  YellowView.swift
//  BookDay
//
//  Created by Isabella Gomes  on 14/02/23.
//

import SwiftUI


struct YellowView: View {
    
    @Binding  var currentStep: Int
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View{
        ZStack{
            Color.corAmarela
                .ignoresSafeArea()
            
                VStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text("To start your journey add a new book...")
                                .font(Font.custom("Raleway", size: 24).weight(.semibold))
                                .multilineTextAlignment(.leading)
                            Image("dots5")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/120)
                                .multilineTextAlignment(.leading)
                        }.padding(.bottom)
                         
                        Rectangle()
                            .foregroundColor(Color.corAmarela)
                            .frame(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/10)
                        
                    }.padding(.horizontal, UIScreen.main.bounds.width/15)
                    .padding(.top, UIScreen.main.bounds.height/12)
                        
                    
                    HStack(alignment: .bottom){
                        Spacer()
                        Button {
                            shouldShowOnboarding.toggle()
                        } label: {
                            Image("letsGoButton")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width/4.5, height: UIScreen.main.bounds.height/25)

                        }.buttonStyle(.plain)
                        
                    }.padding(.horizontal, UIScreen.main.bounds.width/10)
                        .padding(.top, UIScreen.main.bounds.height/1.7)

                }
                
        }
    }
}
