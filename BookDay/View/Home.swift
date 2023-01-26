//
//  HomeView.swift
//  BookDay
//
//  Created by Vivian Bacelar on 25/01/23.
//

import SwiftUI

struct Home: View {
    
    @State private var showingLibrary = false
    @State var percent: CGFloat = 0
    @State var numberPage: CGFloat = 0
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                Color.corGelo
                    .ignoresSafeArea()
                
                
                VStack (spacing: 20){
                    
                    Text("BookDay")
                        .font(Font.custom("BelyDisplay-Regular", size: 35))
                        .padding(.top, 60)
                    
                    ProgressBar(width: 200, height: 30, percent: percent, color: .corRosa)
                        .padding(.top, 85)
                    
                    HStack (spacing: 120) {
                        
                        Text("\(Int(percent))%")
                            .font(.system(size: 10, weight: .light))
                            .multilineTextAlignment(.leading)
                            
                        
                        //Descobrir como colocar o número da página que está
                        Text("\(Int(numberPage))")
                            .font(.system(size: 10, weight: .light))
                           

                    }
                    
                    Button (action: {showingLibrary = true}) {
                        Image("AddNewBook")
                            .resizable()
                            .frame(width: 291, height: 433)
                           
                    
                    }.buttonStyle(.plain)
                    
                    NavigationLink("", destination: Library(), isActive: $showingLibrary)
                    
                }
            }.onAppear {
                print("OK")
                for family in UIFont.familyNames.sorted() {
                    let names = UIFont.fontNames(forFamilyName: family)
                    print("Family: \(family) Font names: \(names)")
                }
            }
            
        }
        
        
        //        struct Home_Previews: PreviewProvider {
        //            static var previews: some View {
        //                Home()
        //            }
        //        }
    }
}

