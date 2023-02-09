//
//  ProgressTab.swift
//  BookDay
//
//  Created by Vivian Bacelar on 26/01/23.
//

import SwiftUI

struct ProgressBarView: View {
    
    //    var width: CGFloat =  200
    //    var height: CGFloat = 20
    //    var percent: CGFloat = 69
    //    var color = Color.corRosa
    @State var progress: String = "0.0"
    var receivedProgress: Double {
        (Double(progress) ?? 0.0)/100
    }
    
    
    var body: some View {
        
                VStack{
                    ProgressView(value: receivedProgress, total: 1)
                        .tint(Color.corRosa)
        
                }
                .progressViewStyle(PinkBorderedProgressViewStyle())
        
        
        //      let multiplier = width / 100
        //        GeometryReader{ geometry in
        //                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
        //                               .opacity(0.3)
        //                               .foregroundColor(Color.corCinzaMaisEscuro)
        //
        //                           Rectangle().frame(width: min(CGFloat(self.receivedProgress)*geometry.size.width, geometry.size.width), height: geometry.size.height)
        //                    .foregroundColor(Color.corRosa)
        //                               .animation(.linear)
        //                       }.cornerRadius(45.0)
        
//        GeometryReader { geo in
//        RoundedRectangle(cornerRadius: 3.0, style: .circular)
//            .frame(height: 6)
//            .foregroundColor(Color.corCinzaMaisEscuro)
//            .padding([.leading, .trailing], 0)
//
//        RoundedRectangle(cornerRadius: 3.0, style: .circular)
//            .foregroundColor(Color.corRosa)
//            .background(LinearGradient(gradient: Gradient(stops: [.init(color: .corCinzaMaisEscuro, location: 0), .init(color: .corRosa, location: receivedProgress)]),startPoint: .leading, endPoint: .trailing))
//            .frame(width: geo.size.width * receivedProgress, height: 6)
//            .cornerRadius(3.0)
//
//        }
//        .padding(0)
//        .frame(height: 6)
    }
}


//struct ProgressBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressBarView()
//    }
//}

struct PinkBorderedProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .padding(4)
            .padding(.horizontal)
//            .border(.pink, width: 3)
            .cornerRadius(4)
    }
}
