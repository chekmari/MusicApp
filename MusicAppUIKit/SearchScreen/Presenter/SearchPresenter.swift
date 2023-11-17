//
//  SearchPresenter.swift
//  MusicAppUIKit
//
//  Created by macbook on 15.11.2023.
//

import Foundation

protocol SearchViewPresenterProtocol: AnyObject {
    // TODO: - заменить модель
    init(view: SearchViewProtocol, model: Model, router: RouterProtocol)
    func some()
}

final class SearchPresenter {
    let router: RouterProtocol
    weak var view: SearchViewProtocol?
    let model: Model?
    
    required init(view: SearchViewProtocol, model: Model, router: RouterProtocol) {
        self.view = view
        self.model = model
        self.router = router
    }
}

extension SearchPresenter: SearchViewPresenterProtocol {

    func some() {
        
    }
    
    
}
