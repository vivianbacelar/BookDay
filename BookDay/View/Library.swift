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
            
            Text("BookDay")
                .font(Font.custom("BelyDisplay-Regular", size: 23))
                .padding(.bottom, 650)
            
            
            VStack{
          
                Picker("", selection: $selected){
                    Text("Want to Read")
                        .font(Font.custom("Raleway", size: 18))
                        .tag("Want to Read")
                    Text("Read")
                        .font(Font.custom("Raleway", size: 18))
                        .tag("Read")
            
                }
                .pickerStyle(.wheel)
                .frame(width: 300, height: 300)
                 
            }
            
        }
    }
    
    struct Library_Previews: PreviewProvider {
        static var previews: some View {
            Library()
        }
    }
}
