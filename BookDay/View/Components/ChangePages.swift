//
//  ChangePages.swift
//  BookDay
//
//  Created by Vivian Bacelar on 02/02/23.
//

import SwiftUI

struct ChangePages: View {
    
    @Binding var showChanges: Bool
    var selectedItem: Item?
    
    var body: some View {
        
        VStack {
            Image("removeBook")
                .resizable()
                .scaledToFit()
                .frame(height: UIScreen.main.bounds.height/2.5)
                .overlay(content: {
                    VStack (spacing: 2){
                        Button{
                            print("Reading")
                            showChanges = false
                            DAO.shared.change(item: selectedItem!, from: .wantToRead, to: .reading)
                        }label:{
                            Image("moveReading")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/12)
                        }.buttonStyle(.plain)
                          
                   
                        Button{
                            print("moveRead")
                            showChanges = false
                            DAO.shared.change(item: selectedItem!, from: .wantToRead, to: .read)
                        }label:{
                            Image("moveRead")
                                .resizable()
                                .scaledToFit()
                                .frame(width:  UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/12)
                        }.buttonStyle(.plain)
//                            .padding(.top, UIScreen.main.bounds.height/4)
                        Button{
                            showChanges = false
                            DAO.shared.change(item: selectedItem!, from: .wantToRead, to: .read)
                        }label:{
                            Image("moveAbandon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/12)
                        }.buttonStyle(.plain)
//                            .padding(.top, UIScreen.main.bounds.height/4)
                  
                    }
                        
                        Button(action: {
                            withAnimation{
                                print("close")
                                showChanges.toggle()
                            }
                        }){
                            Image("close")
                                .resizable()
                                .scaledToFit()
                                .frame(height: UIScreen.main.bounds.height/3)
                        }.buttonStyle(.plain)
                        .padding(.top, UIScreen.main.bounds.height/2.9)
               
                }
            )}
        }
    }


//struct ChangePages_Previews: PreviewProvider {
//    static var previews: some View {
//        ChangePages()
//    }
//}
