//
//  ContentCell.swift
//  BookDay
//
//  Created by Isabella Gomes  on 31/01/23.
//

import Foundation
import SwiftUI

struct ContentCell: View {
    let item: Item
    let isExpanded: Bool

    var body: some View {
        HStack {
            VStack(alignment: .leading) {

                HStack {

                    Text ("Description")
                        .font(.custom("Raleway", size: 15).weight(.semibold))
                        .foregroundColor(Color.corPreta)
                        .padding (.leading, UIScreen.main.bounds.height/25)
                        .padding(.top)

                    Spacer()

                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(Color.corPreta)
                        .font(.system(size: 20, weight: .thin))
                        .padding(.trailing, UIScreen.main.bounds.width/10)
                }
                if isExpanded {
                    VStack (alignment: .center) {
                        LabelAlignment(text: item.volumeInfo.description ?? "", textAlignmentStyle: .justified, width: UIScreen.main.bounds.width/1.21, color: UIColor(Color.corCinzaEscuro), font: UIFont(name: "Raleway", size: 14)!)
                            .padding(.top, UIScreen.main.bounds.height/105)
                            .padding (.horizontal, UIScreen.main.bounds.width/12)
                    }
                }
                Spacer()
            }
            .contentShape(Rectangle())

        }
    }
}

