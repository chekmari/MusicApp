//
//  ModelBuilder.swift
//  MusicAppUIKit
//
//  Created by macbook on 08.11.2023.
//

import UIKit

protocol BuilderProtocol {
    func createLoginModule(router: RouterProtocol) -> UIViewController
    func createNewSongsModule(router: RouterProtocol) -> UIViewController
    func createDiscoverModule(router: RouterProtocol) -> UIViewController
    func createPlayerModule(router: RouterProtocol) -> UIViewController
    func createSearchModule(router: RouterProtocol) -> UIViewController
    func createBrowserScreen(router: RouterProtocol) -> UIViewController
}

class Builder: BuilderProtocol {
    func createLoginModule(router: RouterProtocol) -> UIViewController {
        let model = Model()
        let view = LoginVC()
        let presenter = LoginPresenter(view: view, model: model, router: router)
        view.presenter = presenter
        view.loginView.presenter = presenter
        return view
    }
    
    func createNewSongsModule(router: RouterProtocol) -> UIViewController {
        let model = Model()
        let view = NewDropsVC()
        let presenter = NewDropsPresenter(view: view, model: model, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDiscoverModule(router: RouterProtocol) -> UIViewController {
        let model = Model()
        let view = DiscoverVC()
        let presenter = DiscoverPresenter(view: view, model: model, router: router)
        view.presenter = presenter
        return view
    }
    
    func createPlayerModule(router: RouterProtocol) -> UIViewController {
        let model = Model()
        let view = PlayerVC()
        let presenter = PlayerPresenter(view: view, model: model, router: router)
        view.presenter = presenter
        return view
    }
    
    func createSearchModule(router: RouterProtocol) -> UIViewController {
        let model = Model()
        let view = SearchVC()
        let presenter = SearchPresenter(view: view, model: model, router: router)
        view.presenter = presenter
        return view
    }
    
    func createBrowserScreen(router: RouterProtocol) -> UIViewController {
        return BrowserVC()
    }
}

