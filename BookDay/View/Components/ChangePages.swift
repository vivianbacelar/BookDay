//
//  ChangePages.swift
//  BookDay
//
//  Created by Vivian Bacelar on 02/02/23.
//

import SwiftUI

struct ChangePages: View {
    
    @Binding var show: Bool
    var selectedItem: Item?
    
    
    var body: some View {
        
        Image("removeBook")
            .overlay(content: {
                VStack{
                    Button{
                        print("Reading")
                        show.toggle()
                        DAO.shared.add(to: .reading, selectedItem!)
                    }label:{
                        Image("moveReading")
                    }.buttonStyle(.plain)
                    
                    Button{
                        print("moveRead")
                        show.toggle()
                        DAO.shared.add(to: .read, selectedItem!)
                    }label:{
                        Image("moveRead")
                    }.buttonStyle(.plain)
                    Button{
                        print("delete")
                        show.toggle()
                    }label:{
                        Image("delete")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/1.5)
                    }.buttonStyle(.plain)
                    
                    Button(action: {
                        withAnimation{
                            show.toggle()
                        }
                    }){
                        Image("close")
                    }.buttonStyle(.plain)
                    
                    
                    
                }
            }
         )}
                     
      }
//
//struct ChangePages_Previews: PreviewProvider {
//    static var previews: some View {
//        ChangePages()
//    }
//}
