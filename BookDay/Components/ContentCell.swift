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
                        .font(.custom("Raleway", size: 15).weight(.bold))
                        .foregroundColor(Color.corPreta)
                        .padding (.leading, UIScreen.main.bounds.height/30)
                        .padding(.top)

                    Spacer()

                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(Color.corRosa)
                        .font(.system(size: 22, weight: .regular))
                        .padding(.trailing, UIScreen.main.bounds.width/10)
                }
                if isExpanded {
                    VStack{
                        LabelAlignment(text: item.volumeInfo.description ?? "", textAlignmentStyle: .justified, width: UIScreen.main.bounds.width - 40, color: UIColor(Color.corCinzaEscuro), font: UIFont(name: "Raleway", size: 15)!)
                            .padding(.top, UIScreen.main.bounds.height/35)
                            .padding (.horizontal, UIScreen.main.bounds.width/15)
                    }
                }
                Spacer()
            }
            .contentShape(Rectangle())

        }
    }
}
