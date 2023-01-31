//
//  ProgressTab.swift
//  BookDay
//
//  Created by Vivian Bacelar on 26/01/23.
//

import SwiftUI

struct ProgressBar: View {
    
    var width: CGFloat =  200
    var height: CGFloat = 20
    var percent: CGFloat = 69
    var color = Color.corRosa
    
    var body: some View {
      let multiplier = width / 100
        
        ZStack (alignment: .leading){
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width, height: height)
                .foregroundColor(Color.black.opacity(0.1))
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: percent * multiplier, height: height)
                .foregroundColor(Color.corRosa)
            
                .foregroundColor(.clear)
            
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}
