//
//  LoginPresenter.swift
//  MusicAppUIKit
//
//  Created by macbook on 08.11.2023.
//

import Foundation

protocol LoginViewPresenterProtocol: AnyObject {
    init(view: LoginViewProtocol, model: Model, router: RouterProtocol)
    func signWithGoogle()
    func signWithApple()
    func signIn()
    func createAccount()
}

final class LoginPresenter {
    let router: RouterProtocol
    weak var view: LoginViewProtocol?
    let model: Model?
    
    required init(view: LoginViewProtocol, model: Model, router: RouterProtocol) {
        self.view = view
        self.model = model
        self.router = router
    }
}

extension LoginPresenter: LoginViewPresenterProtocol {
    
    
    func signWithGoogle() {
        
    }
    
    func signWithApple() {
        
    }
    
    func signIn() {
        router.setTabBarController()
    }
    
    func createAccount() {
        router.setBrowserScreen()
    }
}
