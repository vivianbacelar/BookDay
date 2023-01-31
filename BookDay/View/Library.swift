//
//  LibraryView.swift
//  BookDay
//
//  Created by Vivian Bacelar on 25/01/23.
//

import SwiftUI

struct Library: View {
    
    @State private var selected = "Want to Read"
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .cyan
            UISegmentedControl.appearance().setTitleTextAttributes(
                [
                    .font: UIFont.boldSystemFont(ofSize: 18),
                    .foregroundColor: UIColor.white
            ], for: .selected)

            UISegmentedControl.appearance().setTitleTextAttributes(
                [
                    .font: UIFont.boldSystemFont(ofSize: 18),
                    .foregroundColor: UIColor.blue
            ], for: .normal)
        }

    
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
                .pickerStyle(.segmented)
                .frame(width: 300, height: 300)
                
                
                Rectangle()
                .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                .frame(width: 310, height: 8)
//                .padding(.top, 363)
//
                
                Rectangle()
                    .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                .frame(width: 310, height: 8)
//                .padding(.top, 500)
                
                Rectangle()
                    .fill(Color.corCinzaClaro)
                .frame(width: 310, height: 8)
            }
            
        }
    }
    
    struct Library_Previews: PreviewProvider {
        static var previews: some View {
            Library()
        }
    }
}
