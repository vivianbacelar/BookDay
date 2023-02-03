//
//  JustifiedText.swift
//  BookDay
//
//  Created by Isabella Gomes  on 31/01/23.
//

import Foundation
import UIKit
import SwiftUI

struct LabelAlignment: UIViewRepresentable {
    var text: String
    var textAlignmentStyle : TextAlignmentStyle
    var width: CGFloat
    var color: UIColor
    var font: UIFont


 func makeUIView(context: Context) -> UILabel {
     let label = UILabel()
     label.textAlignment = NSTextAlignment(rawValue: textAlignmentStyle.rawValue)!
     label.numberOfLines = 0
     label.preferredMaxLayoutWidth = width
     label.setContentHuggingPriority(.required, for: .horizontal)
     label.setContentHuggingPriority(.required, for: .vertical)
     label.textColor = color
     label.font = font

     return label
 }

 func updateUIView(_ uiView: UILabel, context: Context) {
     uiView.text = text
     uiView.textColor = color
     uiView.font = font
 }
}

enum TextAlignmentStyle : Int{
  case left = 0 ,center = 1 , right = 2 ,justified = 3 ,natural = 4
}
