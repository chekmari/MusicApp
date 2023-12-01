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
    
    // MARK: - UI elements
    private(set) lazy var rightBarButtonItem: UIButton = Factories.NavigationBar.Buttons.largeTitleViewRightBarButton(
        target: self,
        action: #selector(rightButtonTapped),
        event: .touchUpInside
    )
    private(set) lazy var largeTitleViewRightBarButton: UIButton = Factories.NavigationBar.Buttons.largeTitleViewRightBarButton(
        target: self,
        action: #selector(rightButtonTapped),
        event: .touchUpInside
    )
    private(set) var collectionView: UICollectionView!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
}

// MARK: - Setup UI
extension NewDropsVC {
    private func setupUI() {
        view.backgroundColor = .black
        setupCollectionView()
        setNavigationLargeRightButton()
        addView()
        setConstraints()
    }
    
    private func addView() {
        view.addSubview(collectionView)
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
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(8)
            $0.left.right.bottom.equalToSuperview()
        }
    }
}

// MARK: - Collection View
extension NewDropsVC {
    private func setupCollectionView() {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: createLayoutForCollectionView()
        )
        collectionView.backgroundColor = .black
        collectionView.register(
            NewDropsCell.self,
            forCellWithReuseIdentifier: NewDropsCell.id
        )
        collectionView.dataSource = self
        collectionView.delegate = self
        self.collectionView = collectionView
    }
    
    private func createLayoutForCollectionView() -> UICollectionViewLayout {
        // Размер ячейки
        let itemSize = NSCollectionLayoutSize(
            widthDimension:  .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 12, leading: 0, bottom: 12, trailing: 0
        )
        // Размер группы
        let groupSize = NSCollectionLayoutSize(
            widthDimension:  .fractionalWidth(1.0),
            heightDimension: .absolute(243)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )
        // Размер секции
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 13,
            bottom: 0,
            trailing: 13
        )
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

// MARK: - Delegate
extension NewDropsVC: UICollectionViewDelegate {

}

// MARK: - UICollectionViewFlowLayout

// MARK: - Data Source
extension NewDropsVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        mockData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: NewDropsCell.id,
            for: indexPath) as? NewDropsCell else { return UICollectionViewCell() }
        
        let data = mockData[indexPath.item]
        
        cell.configure(
            name: data.name!,
            song: data.song!,
            year: data.year!,
            image: data.image!
        )
        
        return cell
    }
}

// MARK: - Actions
extension NewDropsVC {
    private func addActions() {

    }
    
    @objc
    func rightButtonTapped() {
        print("s")
    }
}

// MARK: - NewDropsViewProtocol
extension NewDropsVC: NewDropsViewProtocol {
    func g() {
        
    }
}

// MARK: Scroll View Delegate
extension NewDropsVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= 3 {
            let view = rightBarButtonItem
            let rightBar = UIBarButtonItem(customView: view)
            view.transform = CGAffineTransformMakeTranslation(10, 0)
            navigationItem.rightBarButtonItem = rightBar
            navigationItem.rightBarButtonItem?.tintColor = .navBarTitle
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
}

   
