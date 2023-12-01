//  NewDropsCell.swift

import UIKit
import SDWebImage

final class NewDropsCell: UICollectionViewCell {
    static let id = "NewDropsCell"
    
    // MARK: - UI elements
    lazy var imageView: UIImageView = Factories.NewDropsScreen.Images.imageView()
    lazy var nameArtist: UILabel = Factories.NewDropsScreen.Labels.createLabel(
        font: Resources.Fonts.interSemiBold.size(20) ?? UIFont.systemFont(ofSize: 20)
    )
    lazy var nameSong: UILabel = Factories.NewDropsScreen.Labels.createLabel(
        font: Resources.Fonts.interMedium.size(14) ?? UIFont.systemFont(ofSize: 14)
    )
    lazy var yearLabel: UILabel = Factories.NewDropsScreen.Labels.createLabel(
        font: Resources.Fonts.interRegular.size(10) ?? UIFont.systemFont(ofSize: 10)
    )
    lazy var purpleView: UIView = {
        let view = UIView()
        view.backgroundColor = .newDropsCellBackground
        view.layer.maskedCorners = [
            .layerMinXMaxYCorner,
            .layerMaxXMaxYCorner
        ]
        view.layer.cornerRadius = 10
        return view
    }()
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.spacing = 6
        return stack
    }()
    lazy var playButton: UIButton = Factories.NewDropsScreen.Buttons.playButton()

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    public func configure(name: String, song: String,
                          year: String, image: String) {
        let url = URL(string: image)
        imageView.sd_setImage(with: url, placeholderImage: .notFoundNewSongsCell)
        nameSong.text = name
        nameArtist.text = song
        yearLabel.text = year
    }
}

// MARK: - Setup UI
extension NewDropsCell {
    private func setupUI() {
        layer.cornerRadius = 10
        backgroundColor = .black
        addView()
        setConstraints()
    }
    
    private func addView() {
        addSubview(purpleView)
        addSubview(imageView)
        purpleView.addSubview(stackView)
        purpleView.addSubview(playButton)
        stackView.addArrangedSubview(nameArtist)
        stackView.addArrangedSubview(nameSong)
        stackView.addArrangedSubview(yearLabel)
    }
    private func setConstraints() {
        let w = UIScreen.main.bounds.width
        let h = UIScreen.main.bounds.height
        
        purpleView.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview()
            $0.height.equalToSuperview().dividedBy(3)
        }
        imageView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.bottom.equalTo(purpleView.snp.top)
        }
        stackView.snp.makeConstraints {
            $0.left.equalToSuperview().inset(18)
            $0.top.bottom.equalToSuperview().inset(4)
            $0.right.equalTo(playButton.snp.left).inset(-18)
        }
        playButton.snp.makeConstraints {
            $0.right.equalToSuperview().inset(18)
            $0.height.width.equalTo(45)
            $0.centerY.equalToSuperview()
        }
    }
}

