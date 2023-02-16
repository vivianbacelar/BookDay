//
//  endEditing.swift
//  BookDay
//
//  Created by Isabella Gomes  on 16/02/23.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
