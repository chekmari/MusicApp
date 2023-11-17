//
//  PlayerVC.swift
//  MusicAppUIKit
//
//  Created by macbook on 14.11.2023.
//

import UIKit

protocol PlayerViewProtocol: AnyObject {
    func g()
}

class PlayerVC: UIViewController {
    var presenter: PlayerViewPresenterProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
}

extension PlayerVC: PlayerViewProtocol {
    func g() {
        
    }
    
    
}

