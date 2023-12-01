//
//  Factories.swift
//  MusicAppUIKit
//
//  Created by macbook on 08.11.2023.
//

import Foundation
import UIKit

final class Factories {
    enum NavigationController {
        static func setupTabBar() {
            UITabBar.appearance().unselectedItemTintColor = .navBarItem
            UITabBar.appearance().tintColor = .navBarItemSelected
            UITabBar.appearance().backgroundColor = .black
            UITabBar.appearance().barTintColor = .black
            UITabBar.appearance().isTranslucent = false
        }
        
        static func setupNabigationBar() {
            let largeFont = Resources.Fonts.interBold.size(40)
            let font = Resources.Fonts.interSemiBold.size(18)
            let attrLarge: [NSAttributedString.Key:Any] = [
                .font: largeFont!,
                .foregroundColor: UIColor.navBarTitle
            ]
            let attr: [NSAttributedString.Key:Any] = [
                .font: font!,
                .foregroundColor: UIColor.navBarTitle
            ]
            
            UINavigationBar.appearance().prefersLargeTitles = true
            UINavigationBar.appearance().titleTextAttributes = attr
            UINavigationBar.appearance().largeTitleTextAttributes = attrLarge
            UINavigationBar.appearance().barTintColor = .black
        }
    }
    enum NavigationBar {
        enum Buttons {
            static func largeTitleViewRightBarButton(target: Any, action: Selector, event: UIControl.Event) -> UIButton {
                let button = UIButton(type: .custom)
                button.translatesAutoresizingMaskIntoConstraints = false
                button.imageView?.tintColor = .navBarItem
                button.setImage(.navBarAccount, for: .normal)
                button.addTarget(target, action: action, for: event)
                return button
            }
            
            static func rightBarButtonItem(target: Any, action: Selector) -> UIBarButtonItem {
                let barButtonItem = UIBarButtonItem(
                    image: UIImage.navBarAccount,
                    style: .plain,
                    target: target,
                    action: action
                )
                return barButtonItem
            }
        }
    }
    
    enum LoginScreen {
        enum Buttons {
            static func createSignButton(
                with text: String.LocalizationValue,
                background color: UIColor,
                logo: UIImage,
                placement: NSDirectionalRectEdge
            ) -> UIButton {
                let button = UIButton()
                var config = UIButton.Configuration.gray()
                config.baseBackgroundColor = color
                config.baseForegroundColor = .white
                config.image = logo
                config.imagePadding = 8
                config.background.cornerRadius = 4
                config.imagePlacement = placement
                config.title = String(localized: text)
                config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                    var outgoing = incoming
                    outgoing.font = UIFont(
                        name: Resources.Fonts.interMedium.rawValue,
                        size: 15
                    )
                    return outgoing
                }
                button.configuration = config
                return button
            }
        }
        
        enum Views {
            static func createORView() -> UIView {
                let container = UIView()
                let leftImage = UIImageView(image: .loginOr)
                let rightImage = UIImageView(image: .loginOr)
                let label = UILabel()
                
                label.text = String(localized: Resources.LocaleStringKeys.orLabelLoginScreen.rawValue)
                label.textColor = .white
                label.textAlignment = .center
                label.font = UIFont(
                    name: Resources.Fonts.interRegular.rawValue,
                    size: 12
                )
                label.backgroundColor = .clear
                label.adjustsFontSizeToFitWidth = true
                
                container.addSubview(label)
                container.addSubview(leftImage)
                container.addSubview(rightImage)
                
                label.snp.makeConstraints {
                    $0.centerX.equalToSuperview()
                    $0.centerY.equalToSuperview()
                    $0.height.width.equalTo(19)
                }
                leftImage.snp.makeConstraints {
                    $0.left.equalToSuperview()
                    $0.right.equalTo(label.snp.left).inset(-4)
                    $0.centerY.equalToSuperview()
                }
                rightImage.snp.makeConstraints {
                    $0.right.equalToSuperview()
                    $0.left.equalTo(label.snp.right).inset(-4)
                    $0.centerY.equalToSuperview()
                }
                return container
            }
        }
        
        enum StackViews {
            static func createStackView() -> UIStackView {
                let stack = UIStackView()
                stack.distribution = .fillEqually
                stack.spacing = 25
                stack.axis = .vertical
                stack.alignment = .fill
                return stack
            }
        }
        
        enum TextField {
            static func createTextField(
                placeholder: String.LocalizationValue,
                keyboard type: UIKeyboardType,
                isSecure: Bool
            ) -> UITextField {
                let tf = UITextField()
                let imageView  = UIImageView(image: .eyeTextfield)
                let paddingView = UIView(
                    frame: CGRect(
                        x: 0,
                        y: 0,
                        width: 16,
                        height: tf.frame.height
                    )
                )
                let rightView = UIView()
                rightView.addSubview(imageView)
                rightView.snp.makeConstraints {
                    $0.height.equalTo(18)
                    $0.width.equalTo(18)
                }
                imageView.snp.makeConstraints {
                    $0.right.equalToSuperview().inset(16)
                    $0.height.equalTo(18)
                    $0.width.equalTo(18)
                    $0.centerY.equalToSuperview()
                }
                imageView.contentMode = .scaleAspectFit
                
                if type == .default {
                    tf.rightViewMode = .always
                    tf.rightView = rightView
                }
                
                tf.font = UIFont(
                    name: Resources.Fonts.interRegular.rawValue,
                    size: 16
                )
                tf.textColor = .signInLoginTextfield
                tf.placeholder = String(localized: placeholder)
                tf.isSecureTextEntry = isSecure
                tf.keyboardType = type
                tf.autocapitalizationType = .none
                tf.leftView = paddingView
                tf.leftViewMode = .always
                tf.tintColor = .signInLoginTextfield.withAlphaComponent(0.2)
                tf.allowsEditingTextAttributes = false
                tf.autocorrectionType = .no
                tf.spellCheckingType = .no
                tf.layer.borderWidth = 1
                tf.layer.borderColor = UIColor.signInLoginTextfield.withAlphaComponent(0.2).cgColor
                tf.layer.cornerRadius = 4
                return tf
            }
        }
        
        enum Labels {
            static func createLabel() -> UILabel {
                let label = UILabel()
                let createAccountText = String(localized: Resources.LocaleStringKeys.createAccountLabel.rawValue)
                let notAMemberText = String(localized: Resources.LocaleStringKeys.notAMemberLabel.rawValue)
                let fullText = "\(notAMemberText) \(createAccountText)"
                let attributedString = NSMutableAttributedString(string: fullText)
                
                attributedString.addAttribute(
                    .foregroundColor,
                    value: UIColor.signInLoginTextfield.withAlphaComponent(0.6),
                    range: NSRange(
                        location: 0,
                        length: notAMemberText.count
                    )
                )
                attributedString.addAttributes([
                    .foregroundColor: UIColor.signInLoginTextfield,
                    .underlineStyle: NSUnderlineStyle.single.rawValue,
                ], range: NSRange(
                    location: notAMemberText.count + 1,
                    length: createAccountText.count
                )
                )
                
                label.adjustsFontSizeToFitWidth = true
                label.attributedText = attributedString
                label.font = UIFont(name: Resources.Fonts.interRegular.rawValue, size: 16)
                return label
            }
        }
    }
    
    enum NewDropsScreen {
        enum Buttons {
            static func playButton() -> UIButton {
                let button = UIButton()
                button.setImage(.playButton, for: .normal)
                return button
            }
        }
        
        enum Labels {
            static func createLabel(font: UIFont) -> UILabel {
                let label = UILabel()
                label.text = "Kendrick Lamar"
                label.textAlignment = .left
                label.numberOfLines = 1
                label.font = font
                label.textColor = .white
                return label
            }
        }
        
        enum Images {
            static func imageView() -> UIImageView {
                let imageView = UIImageView()
                imageView.contentMode = .scaleAspectFill
                imageView.clipsToBounds = true
                imageView.layer.maskedCorners = [
                    .layerMinXMinYCorner,
                    .layerMaxXMinYCorner
                ]
                imageView.layer.cornerRadius = 10
                return imageView
            }
        }
    }
    enum DiscoverScreen {
        static func s() {
            
        }
    }
    enum PlayerScreen {}
    enum SearchScreen {
        
    }
}
