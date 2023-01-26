//
//  ContentView.swift
//  BookDay
//
//  Created by Vivian Bacelar on 24/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var percent: CGFloat = 0
    @State var numberPage: CGFloat = 0
    
    var body: some View {
        
        VStack (spacing: 20){
            
            ProgressBar(width: 200, height: 30, percent: percent, color: .corRosa)
            
            HStack (spacing: 120) {
                
                Text("\(Int(percent))%")
                    .font(.system(size: 20, weight: .bold))
                    .multilineTextAlignment(.leading)
                
                //Descobrir como colocar o número da página que está
                Text("\(Int(numberPage))")
                    .font(.system(size: 20, weight: .bold))
                
                
                    
                
                
            }
        }
    }
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
