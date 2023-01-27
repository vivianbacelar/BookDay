//
//  Strings.swift
//  BookDay
//
//  Created by Isabella Gomes  on 27/01/23.
//

import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
