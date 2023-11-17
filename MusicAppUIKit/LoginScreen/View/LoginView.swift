//
//  LoginVIew.swift
//  MusicAppUIKit
//
//  Created by macbook on 08.11.2023.
//

import UIKit

final class LoginView: UIView {
    var presenter: LoginViewPresenterProtocol?
    var isSecurePassword: Bool = true
    
    // MARK: - UI Elements
    private lazy var signInStackView = Factories.LoginScreen.StackViews.createStackView()
    private lazy var authStackView = Factories.LoginScreen.StackViews.createStackView()
    private lazy var googleButton = Factories.LoginScreen.Buttons.createSignButton(
        with: Resources.LocaleStringKeys.signGoogleButton.rawValue,
        background: .signInWithGoogleButtonBackground,
        logo: .signInGoogleButton, 
        placement: .leading
    )
    private lazy var appleButton = Factories.LoginScreen.Buttons.createSignButton(
        with: Resources.LocaleStringKeys.signAppleButton.rawValue,
        background: .signInWithAppleButtonBackground,
        logo: .signInAppleButton,
        placement: .leading
    )
    private lazy var orLabel = Factories.LoginScreen.Views.createORView()
    private lazy var loginTextField = Factories.LoginScreen.TextField.createTextField(
        placeholder: Resources.LocaleStringKeys.loginTextField.rawValue,
        keyboard: .emailAddress, 
        isSecure: false
    )
    private lazy var passwordTextField = Factories.LoginScreen.TextField.createTextField(
        placeholder: Resources.LocaleStringKeys.passwordTextField.rawValue,
        keyboard: .default,
        isSecure: true
    )
    private lazy var signInButton = Factories.LoginScreen.Buttons.createSignButton(
        with: Resources.LocaleStringKeys.loginButton.rawValue,
        background: .signInWithAppleButtonBackground,
        logo: .signInButton,
        placement: .trailing
    )
    private lazy var labelContainterView = UIView()
    private lazy var createAccountLabel = Factories.LoginScreen.Labels.createLabel()
    
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addActions()
        setupUI()
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Actions
extension LoginView {
    private func addActions() {
        googleButton.addTarget(
            self,
            action: #selector(googleButtonTapped),
            for: .touchUpInside
        )
        appleButton.addTarget(
            self,
            action: #selector(appleButtonTapped),
            for: .touchUpInside
        )
        signInButton.addTarget(
            self,
            action: #selector(signInButtonTapped),
            for: .touchUpInside
        )
    }
    
    @objc
    public func createAccountTapped(_ sender: UITapGestureRecognizer) {
        presenter?.createAccount()
    }
    
    @objc
    func passwordSecureTapped(_ sender: UITapGestureRecognizer) {
        guard let rightView = passwordTextField.rightView,
              let imageView = rightView.subviews.first as? UIImageView else { return }
        
        passwordTextField.isSecureTextEntry.toggle()
        
        if passwordTextField.isSecureTextEntry {
            imageView.image = UIImage.eyeTextfield
        } else {
            imageView.image = UIImage.eyeSlashTextfield
        }
    }
    
    @objc
    func googleButtonTapped() {
        presenter?.signWithGoogle()
    }
    @objc
    func appleButtonTapped() {
        presenter?.signWithApple()
    }
    @objc
    func signInButtonTapped() {
        presenter?.signIn()
    }

}

// MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {

    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

    }
}

// MARK: - SETUP UI
extension LoginView {
    private func setupUI() {
        backgroundColor = .white.withAlphaComponent(0.85)
        layer.cornerRadius = 10
        addTapGestureForCreateButton()
        addTapGestureForTextFieldEyeIcon()
        addView()
        setConstraints()
    }
    
    private func addView() {
        addSubview(signInStackView)
        signInStackView.addArrangedSubview(googleButton)
        signInStackView.addArrangedSubview(appleButton)
        addSubview(authStackView)
        authStackView.addArrangedSubview(loginTextField)
        authStackView.addArrangedSubview(passwordTextField)
        addSubview(signInButton)
        addSubview(createAccountLabel)
        addSubview(labelContainterView)
        labelContainterView.addSubview(orLabel)
    }
    
    private func addTapGestureForCreateButton() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(LoginView.createAccountTapped(_:))
        )
        createAccountLabel.isUserInteractionEnabled = true
        createAccountLabel.addGestureRecognizer(tapGesture)
    }
    
    private func addTapGestureForTextFieldEyeIcon() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(LoginView.passwordSecureTapped(_:))
        )
        passwordTextField.rightView?.isUserInteractionEnabled = true
        passwordTextField.rightView?.addGestureRecognizer(tapGesture)
    }
    
    private func setConstraints() {
        signInStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.left.right.equalToSuperview().inset(49)
            $0.height.equalTo(120)
        }
        orLabel.snp.makeConstraints {
            $0.left.right.centerY.equalToSuperview()
        }
        authStackView.snp.makeConstraints {
            $0.bottom.equalTo(signInButton.snp.top).inset(-24)
            $0.left.right.equalToSuperview().inset(49)
            $0.height.equalTo(120)
        }
        signInButton.snp.makeConstraints {
            $0.bottom.equalTo(createAccountLabel.snp.top).inset(-24)
            $0.left.right.equalToSuperview().inset(49)
            $0.height.equalTo(48)
        }
        labelContainterView.snp.makeConstraints {
            $0.top.equalTo(signInStackView.snp.bottom)
            $0.bottom.equalTo(authStackView.snp.top)
            $0.left.right.equalToSuperview().inset(49)
        }
        createAccountLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(24)
            $0.left.right.equalToSuperview().inset(49)
        }
    }
}
