//
//  PlayerPresenter.swift
//  MusicAppUIKit
//
//  Created by macbook on 15.11.2023.
//

import Foundation

protocol PlayerViewPresenterProtocol: AnyObject {
    // TODO: - заменить модель
    init(view: PlayerViewProtocol, model: Model, router: RouterProtocol)
    func some()
}

final class PlayerPresenter {
    let router: RouterProtocol
    weak var view: PlayerViewProtocol?
    let model: Model?
    
    required init(view: PlayerViewProtocol, model: Model, router: RouterProtocol) {
        self.view = view
        self.model = model
        self.router = router
    }
}

extension PlayerPresenter: PlayerViewPresenterProtocol {

    func some() {
        
    }

}
