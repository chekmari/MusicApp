//  NewSongsPresenter.swift

import Foundation


protocol NewDropsViewPresenterProtocol: AnyObject {
    // TODO: - заменить модель
    init(view: NewDropsViewProtocol, model: Model, router: RouterProtocol)
    func some()
}

final class NewDropsPresenter {
    let router: RouterProtocol
    weak var view: NewDropsViewProtocol?
    let model: Model?
    
    required init(view: NewDropsViewProtocol, model: Model, router: RouterProtocol) {
        self.view = view
        self.model = model
        self.router = router
    }
}

extension NewDropsPresenter: NewDropsViewPresenterProtocol {

    @objc
    func some() {
        
    }

}
