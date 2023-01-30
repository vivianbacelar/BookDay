//
//  LibraryView.swift
//  BookDay
//
//  Created by Vivian Bacelar on 25/01/23.
//

import SwiftUI

struct Library: View {
    
    @State private var selected = "Want to Read"
    
    var body: some View {
        
        ZStack{
            Color.corGelo
                .ignoresSafeArea()
            
            
            VStack{
                
                Text("BookDay")
                    .font(Font.custom("BelyDisplay-Regular", size: 23))
//                    .padding(.bottom, 650)
                
                Picker("", selection: $selected){
                    Text("Want to Read")
                        .font(Font.custom("Raleway", size: 18))
                        .tag("Want to Read")
                    Text("Read")
                        .font(Font.custom("Raleway", size: 18))
                        .tag("Read")
            
                }
                .pickerStyle(.wheel)
                .background(Color.corFundo)
                .frame(width: 200, height: 150)
                
            }
            
        }
    }
    
    struct Library_Previews: PreviewProvider {
        static var previews: some View {
            Library()
        }
    }
}
