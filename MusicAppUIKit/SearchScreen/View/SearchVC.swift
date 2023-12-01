import UIKit
// SearchVC.swift

protocol SearchViewProtocol: AnyObject {
    func g()
}

class SearchVC: UIViewController {
    var presenter: SearchViewPresenterProtocol?
    // MARK: - UI elements

    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Setup UI
extension SearchVC {
    private func setupUI() {
        view.backgroundColor = .black
        addView()
        setConstraints()
    }
    
    private func addView() {

    }
    private func setConstraints() {

    
    }
}

extension SearchVC: SearchViewProtocol {
    func g() {
        
    }
}

// MARK: - UITextFieldDelegate
extension SearchVC: UITextFieldDelegate {
    

}
