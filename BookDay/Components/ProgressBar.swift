//
//  ProgressTab.swift
//  BookDay
//
//  Created by Vivian Bacelar on 26/01/23.
//

import SwiftUI

struct ProgressBarView: View {
    
    var progress: Double
    var qualView: Bool
    
    
    
    
    var body: some View {
        
        
        if qualView{
            VStack{
                ProgressView(value: progress, total: 100)
                    .tint(Color.corRosa)
                
            }
            .progressViewStyle(PinkBorderedProgressViewStyle())
        }else{
            VStack{
                ProgressView(value: progress, total: 100)
                    .tint(Color.corRosa)
                
            }
            .progressViewStyle(BlueBorderedProgressViewStyle())
        }
    }
}
    

struct PinkBorderedProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .scaleEffect(x: 1, y: 2.2, anchor: .center)
            .padding(0.5)
//            .padding(.horizontal)
            
            .cornerRadius(100)
            .frame(width: UIScreen.main.bounds.width/1.3)
    }
}

struct BlueBorderedProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .scaleEffect(x: 1, y: 2.2, anchor: .center)
//            .padding(4)
//            .padding(.horizontal)
            
            .cornerRadius(100)
            .frame(width: UIScreen.main.bounds.width/1.4)
    }
}
