//
//  DiscoverPresenter.swift
//  MusicAppUIKit
//
//  Created by macbook on 15.11.2023.
//

import Foundation

protocol DiscoverViewPresenterProtocol: AnyObject {
    // TODO: - заменить модель
    init(view: DiscoverViewProtocol, model: Model, router: RouterProtocol)
    func some()
}

final class DiscoverPresenter {
    let router: RouterProtocol
    weak var view: DiscoverViewProtocol?
    let model: Model?
    
    required init(view: DiscoverViewProtocol, model: Model, router: RouterProtocol) {
        self.view = view
        self.model = model
        self.router = router
    }
}

extension DiscoverPresenter: DiscoverViewPresenterProtocol {

    func some() {
        
    }
    
    
}
