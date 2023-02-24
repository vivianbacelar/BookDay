//
//  ProgressTab.swift
//  BookDay
//
//  Created by Vivian Bacelar on 26/01/23.
//

import SwiftUI

struct ProgressBarView: View {
    
    var progress: Double
    
    var body: some View {
        
        VStack{
            ProgressView(value: progress, total: 100)
                .tint(Color.corRosa)
            
        }
        .progressViewStyle(PinkBorderedProgressViewStyle())
    }
}
    

struct PinkBorderedProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .scaleEffect(x: 1, y: 2.2, anchor: .center)
            .padding(4)
            .padding(.horizontal)
            .cornerRadius(25)
            .frame(width: UIScreen.main.bounds.width/1.05)
    }
}
