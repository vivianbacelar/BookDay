//
//  LastNotesView.swift
//  BookDay
//
//  Created by Isabella Gomes  on 23/02/23.
//

import SwiftUI

struct LastNotesView: View {
    
    var item : Item 
    
    var body: some View {
        ZStack{
            Color.corGelo
                .ignoresSafeArea()
            VStack{
                Text("Last Notes")
                    .font(Font.custom("Raleway", size: 20).weight(.medium))
                    .foregroundColor(Color.corPreta)
                    .padding(.top, UIScreen.main.bounds.height/20)
                ScrollView{
                    VStack {
                        ForEach (item.savedText ?? [], id: \.self){ saved in
                            VStack{
                                Text(saved)
                                    .font(Font.custom("Raleway", size: 15).weight(.bold))
                                    .foregroundColor(Color.corPreta)
                                    .padding()
                                    .frame( width: UIScreen.main.bounds.width/1.1)
                                    .background(Color.corFundo)
                                    .cornerRadius(15)
                            }.padding(.vertical, UIScreen.main.bounds.height/150)
                            
                        }
                    }
                }
            }
        }
    }
}


