//
//  accent.swift
//  BookDay
//
//  Created by Isabella Gomes  on 06/02/23.
//

import Foundation

extension String {

    func unaccent() -> String {

        return self.folding(options: .diacriticInsensitive, locale: .current)

    }

}
