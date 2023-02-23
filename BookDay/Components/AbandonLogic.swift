//
//  AbandonLogic.swift
//  BookDay
//
//  Created by Vivian Bacelar on 16/02/23.
//

import SwiftUI

struct AbandonLogic: View {
    
    @Binding var showButtons: Bool
    var selectedItem: Item?
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
            
            VStack {
                Image("secondChance")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width/1.45, height: UIScreen.main.bounds.height/3)
                    .overlay(content: {
                        VStack{
                            Spacer()
                            VStack {
                                Button{
                                    print("moveReading")
                                    showButtons = false
                                    DAO.shared.change(item: selectedItem!, from: .abandon, to: .reading)
                                }label:{
                                    Image("readingButton")
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width/1.9, height: UIScreen.main.bounds.height/18)
                                        .padding(.bottom, UIScreen.main.bounds.height/38)
                                }.buttonStyle(.plain)
                                
                                Button{
                                    showButtons = false
                                    DAO.shared.change(item: selectedItem!, from: .abandon, to: .wantToRead)
                                }label:{
                                    Image("wantToReadButton")
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width/1.9, height: UIScreen.main.bounds.height/18)
                                }.buttonStyle(.plain)
                                
                                
                            }.padding(.bottom, UIScreen.main.bounds.height/62)
                            
                            Button(action: {
                                withAnimation{
                                    print("close")
                                    showButtons.toggle()
                                }
                            }){
                                Image("close2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width/1.45, height: UIScreen.main.bounds.height/14)
                            }.buttonStyle(.plain)
                            
                        }
                    }
                    )}
        }   .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.corCinza3.opacity(0.7))
        
        
    }
}

//struct AbandonLogic_Previews: PreviewProvider {
//    static var previews: some View {
//        AbandonLogic()
//    }
//}
