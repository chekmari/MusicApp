//  NewSongsPresenter.swift

import Foundation
import UIKit


protocol NewDropsViewPresenterProtocol: AnyObject {
    // TODO: - заменить модель
    init(view: NewDropsViewProtocol, model: MusicInfo, router: RouterProtocol)
    func some()
}

final class NewDropsPresenter {
    let router: RouterProtocol
    weak var view: NewDropsViewProtocol?
    let model: MusicInfo?
    
    let mockData: [MusicInfo] = [
        MusicInfo(
            name: "Artist 1",
            song: "Song 1",
            year: "2000",
            image: "https://images.unsplash.com/photo-1502710655568-ee441b74b0b9?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
        ),
        MusicInfo(
            name: "Artist 2",
            song: "Song 2",
            year: "2010",
            image: "https://example.com/image2.jpg"
        ),
        MusicInfo(
            name: "Artist 3",
            song: "Song 3",
            year: "2020",
            image: "https://images.unsplash.com/photo-1460723237483-7a6dc9d0b212?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
        ),
        MusicInfo(
            name: "Artist 4",
            song: "Song 4",
            year: "2023",
            image: "https://example.com/image3.jpg"
        )
    ]
    
    required init(view: NewDropsViewProtocol, model: MusicInfo, router: RouterProtocol) {
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
