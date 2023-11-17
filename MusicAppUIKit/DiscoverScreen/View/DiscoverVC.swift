import UIKit
//  DiscoverVC.swift

protocol DiscoverViewProtocol: AnyObject {
    func g()
}

class DiscoverVC: UIViewController {
    var presenter: DiscoverViewPresenterProtocol?

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
//    private(set) lazy var collectionView: UICollectionView

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
       
    }
    
    @objc
    func rightButtonTapped() {
        
    }
    
}


// MARK: - SETUP UI
extension DiscoverVC {
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

// MARK: - DiscoverViewProtocol
extension DiscoverVC: DiscoverViewProtocol {
    func g() {
        
    }
    
    
}

