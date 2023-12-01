import UIKit
//  CategoryCell.swift

class CategoryCell: UICollectionViewCell {
    static let id = "CategoryCell"
    // MARK: - UI elements
    private let imageView = UIImageView()
    private let text = UILabel()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Setup UI
extension CategoryCell {
    private func setupUI() {
        layer.cornerRadius = 10
        backgroundColor = .black
        addView()
        setConstraints()
    }
    
    private func addView() {
        addSubview(imageView)
        addSubview(text)
    }
    private func setConstraints() {
        let w = UIScreen.main.bounds.width
        let h = UIScreen.main.bounds.height
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        text.snp.makeConstraints {
            $0.left.equalToSuperview().inset(20)
            $0.right.equalToSuperview().inset(49)
            $0.bottom.equalToSuperview()
        }
    }
}


