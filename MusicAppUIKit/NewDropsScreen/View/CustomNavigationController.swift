//
//  CustomNavigationController.swift
//  MusicAppUIKit
//
//  Created by macbook on 16.11.2023.
//

import UIKit

final class CustomNavigationController: UICollectionViewCell {
    
    lazy var nameArtist: UILabel = 
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 6
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupUI() {
        
        setConstraints()
    }
    
    private func setConstraints() {
        title.snp.makeConstraints {
            $0.left.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.centerY.equalTo(title.snp.centerY)
            $0.right.equalToSuperview().inset(20)
        }
    }
    
}
