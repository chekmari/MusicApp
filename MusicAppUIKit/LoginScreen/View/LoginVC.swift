//
//  ViewController.swift
//  MusicAppUIKit
//
//  Created by macbook on 08.11.2023.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    func g()
}

class LoginVC: UIViewController {
    var presenter: LoginViewPresenterProtocol?
    
    private lazy var backgroundView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = .loginBackground
        return view
    }()
    lazy var loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}


// MARK: - Setup UI
private extension LoginVC {
    private func setupUI() {
        addView()
        setConstraints()
    }
    
    private func addView() {
        view.addSubview(backgroundView)
        view.addSubview(loginView)
    }
    private func setConstraints() {
        let w = UIScreen.main.bounds.width
        let h = UIScreen.main.bounds.height
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        loginView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(18)
            $0.height.equalTo(w*501/w-36)
            $0.centerY.equalToSuperview()
        }
    }
}


extension LoginVC: LoginViewProtocol {
    func g() {
        
    }
    
    
}
