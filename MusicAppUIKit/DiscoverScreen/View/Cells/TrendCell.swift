import UIKit
//  TrendCell.swift

class TrendCell: UICollectionViewCell {
    static let id = "TrendCell"
    // MARK: - UI elements
    private let imageView = UIImageView()
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 4
        return stack
    }()
    private let name = UILabel()
    private let artist = UILabel()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup UI
extension TrendCell {
    private func setupUI() {
        layer.cornerRadius = 10
        backgroundColor = .black
        addView()
        setConstraints()
    }
    
    private func addView() {
        addSubview(imageView)
        addSubview(stackView)
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(artist)
    }
    private func setConstraints() {
        let w = UIScreen.main.bounds.width
        let h = UIScreen.main.bounds.height
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(186)
            $0.width.equalToSuperview()
        }
        stackView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).inset(11)
            $0.left.right.bottom.equalToSuperview()
        }
    }
}
