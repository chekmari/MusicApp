//
//  NewSongsVC.swift
//  MusicAppUIKit
//
//  Created by macbook on 14.11.2023.
//

import UIKit

protocol NewDropsViewProtocol: AnyObject {
    func g()
}

class NewDropsVC: UIViewController {
    var presenter: NewDropsViewPresenterProtocol?
    
    // MARK: - UI elements
    private(set) lazy var rightBarButtonItem: UIBarButtonItem = Factories.NavigationBar.Buttons.rightBarButtonItem(
        target: self,
        action: #selector(rightButtonTapped)
    )    
    private(set) lazy var largeTitleViewRightBarButton: UIButton = Factories.NavigationBar.Buttons.largeTitleViewRightBarButton(
        target: self,
        action: #selector(rightButtonTapped),
        event: .touchUpInside
    )
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.
        return collectionView
    }()


    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        largeTitleViewRightBarButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
         
    }
        
}

// MARK: - SETUP UI
extension NewDropsVC {
    private func setupUI() {
        view.backgroundColor = .black
        setNavigationLargeRightButton()
        addView()
        setConstraints()
    }
    
    private func addView() {
        
    }
    
    private func setNavigationLargeRightButton() {
        guard let navbar = navigationController?.navigationBar else { return }
        guard let titleLargeView = NSClassFromString("_UINavigationBarLargeTitleView") else { return }
        navbar.subviews.forEach { subview in
            if subview.isKind(of: titleLargeView.self) {
                subview.addSubview(largeTitleViewRightBarButton)
                largeTitleViewRightBarButton.snp.makeConstraints {
                    $0.centerY.equalTo(subview.snp.centerY)
                    $0.right.equalTo(subview.snp.right).inset(16)
                }
            }
        }
    }
    
    private func setConstraints() {
        
    }
}

// MARK: - Actions
extension NewDropsVC {
    private func addActions() {
        
    }
    
    @objc
    func rightButtonTapped() {
        
    }
}

// MARK: - NewDropsViewProtocol
extension NewDropsVC: NewDropsViewProtocol {
    func g() {
        
    }
    
    
}

   
