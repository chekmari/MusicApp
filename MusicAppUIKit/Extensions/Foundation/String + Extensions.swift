//
//  String + extension.swift
//  MusicAppUIKit
//
//  Created by macbook on 08.11.2023.
//

import Foundation
import UIKit

extension String {
    var localized: String {
        NSLocalizedString(
            self,
            comment: "\(self) could not be found in Localizable.string"
        )
    }
}

extension String {
    func underlined() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(
                location: 0,
                length: attributedString.length
            )
        )
        return attributedString
    }
}
