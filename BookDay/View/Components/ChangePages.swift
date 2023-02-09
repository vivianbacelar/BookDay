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
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
            
            VStack {
                Image("removeBook")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width/1.45, height: UIScreen.main.bounds.height/2.6)
                    .overlay(content: {
                        VStack{
                            Spacer()
                            VStack {
                                Button{
                                    print("Reading")
                                    showChanges = false
                                    DAO.shared.change(item: selectedItem!, from: .wantToRead, to: .reading)
                                }label:{
                                    Image("moveReading")
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/19.5)
                                        .padding(.bottom, UIScreen.main.bounds.height/98)
                                }.buttonStyle(.plain)
                                
                                
                                Button{
                                    print("moveRead")
                                    showChanges = false
                                    DAO.shared.change(item: selectedItem!, from: .wantToRead, to: .read)
                                }label:{
                                    Image("moveRead")
                                        .resizable()
                                        .frame(width:  UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/19.5)
                                        .padding(.bottom, UIScreen.main.bounds.height/98)
                                }.buttonStyle(.plain)
                                
                                Button{
                                    showChanges = false
                                    DAO.shared.change(item: selectedItem!, from: .wantToRead, to: .read)
                                    DAO.shared.change(item: selectedItem!, from: .read, to: .read)
                                }label:{
                                    Image("moveAbandon")
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/19.5)
                                }.buttonStyle(.plain)
                                
                                
                            }
                            .padding(.bottom, UIScreen.main.bounds.height/47)
                            
                            Button(action: {
                                withAnimation{
                                    print("close")
                                    showChanges.toggle()
                                }
                            }){
                                Image("close")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width/1.45, height: UIScreen.main.bounds.height/17.5)
                            }.buttonStyle(.plain)
                            //
                            
                        }
                    }
                    )}
        }   .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.corCinza3.opacity(0.7))
    }
}
            


//struct ChangePages_Previews: PreviewProvider {
//    static var previews: some View {
//        ChangePages()
//    }
//}
