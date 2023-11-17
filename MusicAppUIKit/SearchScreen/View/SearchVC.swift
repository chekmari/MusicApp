//
//  SearchVC.swift
//  MusicAppUIKit
//
//  Created by macbook on 14.11.2023.
//

import UIKit

protocol SearchViewProtocol: AnyObject {
    func g()
}

class SearchVC: UIViewController {
    var presenter: SearchViewPresenterProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
    }
    
}

extension SearchVC: SearchViewProtocol {
    func g() {
        
    }
    
    
}
