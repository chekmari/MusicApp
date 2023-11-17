//  Router.swift
import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var builder: BuilderProtocol? { get set }
}

protocol RouterProtocol {
    func setTabBarController()
    func setLoginScreen()
    func setNewSongsScreen()
    func popToRoot()
    func setBrowserScreen()
}


class Router: RouterProtocol, RouterMain {
    var navigationController: UINavigationController?
    var builder: BuilderProtocol?
    
    init(
        navigationController: UINavigationController,
        builder: BuilderProtocol
    ) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func setTabBarController() {
        guard let navigationController = navigationController else { return }
        guard let newSongsVC = builder?.createNewSongsModule(router: self) else { return }
        guard let discoverVC = builder?.createDiscoverModule(router: self) else { return }
        guard let playerVC = builder?.createPlayerModule(router: self) else { return }
        guard let searchVC = builder?.createSearchModule(router: self) else { return }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.selectedItem?.title = nil
        let newSongs = createNavViewController(
            viewController: newSongsVC,
            title: 
                String(
                    localized: Resources.LocaleStringKeys.navbarNewDropsTitle.rawValue
                ),
            image: .tabBarHome
        )
        let discover = createNavViewController(
            viewController: discoverVC,
            title:
                String(
                    localized: Resources.LocaleStringKeys.navbarDiscoverTitle.rawValue
                ),
            image: .tabBarMusic
        )
        let player = createNavViewController(
            viewController: playerVC,
            title: "",
            image: .tabBarPlay
        )
        let search = createNavViewController(
            viewController: searchVC,
            title:
                String(
                    localized: Resources.LocaleStringKeys.navbarSearchTitle.rawValue
                ),
            image: .tabBarSearch
        )
        
    

        
        
        tabBarController.viewControllers = [newSongs, discover, player, search]
        appDelegate.window?.rootViewController = tabBarController
    }

    func setNewSongsScreen() {
        guard let nav = navigationController else { return }
        guard let newDropsVC = builder?.createNewSongsModule(router: self) else { return }
        nav.viewControllers = [newDropsVC]
    }
    
    func setDicoverScreen() {
        guard let nav = navigationController else { return }
        guard let discoverVC = builder?.createDiscoverModule(router: self) else { return }
        nav.viewControllers = [discoverVC]
    }
    
    func setPlayerScreen() {
        guard let nav = navigationController else { return }
        guard let playerVC = builder?.createPlayerModule(router: self) else { return }
        nav.viewControllers = [playerVC]
    }
    
    func setSearchScreen() {
        guard let nav = navigationController else { return }
        guard let searchVC = builder?.createSearchModule(router: self) else { return }
        nav.viewControllers = [searchVC]
    }
    
    
    func setLoginScreen() {
        guard let nav = navigationController else { return }
        guard let loginVC = builder?.createLoginModule(router: self) else { return }
        nav.viewControllers = [loginVC]
    }
    
    func popToRoot() {
        guard let nav = navigationController else { return }
        nav.popToRootViewController(animated: true)
    }
    
    func setBrowserScreen() {
        guard let nav = navigationController else { return }
        guard let vc = builder?.createBrowserScreen(router: self) else { return }
        nav.present(vc, animated: true)
    }
}
  
extension Router {
    private func createNavViewController(viewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = image
        viewController.navigationItem.title = title
        return navController
    }
}
