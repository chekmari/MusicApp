//
//  Resources .swift
//  MusicAppUIKit
//
//  Created by macbook on 08.11.2023.
//

import Foundation
import UIKit

enum Resources {
    
    enum LocaleStringKeys: String.LocalizationValue {
        case signGoogleButton      = "sign_google_button"
        case signAppleButton       = "sign_apple_button"
        case orLabelLoginScreen    = "or_label_login_screen"
        case loginTextField        = "login_textfield"
        case passwordTextField     = "password_textfield"
        case loginButton           = "login_button"
        case createAccountLabel    = "create_an_account"
        case notAMemberLabel       = "not_a_member_label"
        case navbarNewDropsTitle   = "navbar_new_drops_title"
        case navbarDiscoverTitle   = "navbar_discover_title"
        case navbarSearchTitle     = "navbar_search_title"
    }
    
    enum Fonts: String {
        case interBlack      = "Inter-Black"
        case interBold       = "Inter-Bold"
        case interExtraBold  = "Inter-ExtraBold"
        case interExtraLight = "Inter-ExtraLight"
        case interLight      = "Inter-Light"
        case interMedium     = "Inter-Medium"
        case interRegular    = "Inter-Regular"
        case interSemiBold   = "Inter-SemiBold"
        case interThin       = "Inter-Thin"
        
        func size(_ size: CGFloat) -> UIFont? {
            UIFont(name: self.rawValue, size: size)
        }
    }
    
}
