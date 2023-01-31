//
//  LibraryView.swift
//  BookDay
//
//  Created by Vivian Bacelar on 25/01/23.
//

import SwiftUI

struct Library: View {
    
    @State private var selected = "Want to Read"
    @State var count: Int = 0
//    let itens: [Item]
    
    //    let attr = NSDictionary(object: UIFont(name: "Raleway", size: 16.0)!], forKey: NSFontAttributeName)
    //    seg.setTitleTextAttributes(attr as [NSObject : AnyObject] , forState: .Normal)
    //
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "cinzaClaro")
        UISegmentedControl.appearance().setTitleTextAttributes(
            [
                .font: UIFont.boldSystemFont(ofSize: 18),
                .foregroundColor: UIColor(named: "fundo")
            ], for: .selected)
        
        UISegmentedControl.appearance().setTitleTextAttributes(
            [
                .font: UIFont.boldSystemFont(ofSize: 18),
                .foregroundColor: UIColor(named: "preto")
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
                    Spacer()
                    
                    ScrollView(){
                    
                    
                    VStack (spacing: 147){
                        
                        
                        
                        Rectangle()
                            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .frame(width: 310, height: 8)
                        
                        //                    if itens.count > 3 {
                        Rectangle()
                            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .frame(width: 310, height: 8)
                        //                    }
                        
                        
                        Rectangle()
                            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .frame(width: 310, height: 8)
                        
                        Spacer()
                    }
                    
                }
            }
        }
        
    }
}


    struct Library_Previews: PreviewProvider {
        static var previews: some View {
            Library()
        }
    }

