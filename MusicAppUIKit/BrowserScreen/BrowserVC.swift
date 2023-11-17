//
//  BrowserVC.swift
//  MusicAppUIKit
//
//  Created by macbook on 10.11.2023.
//

import UIKit
import WebKit

class BrowserVC: UITabBarController {
    var webView: WKWebView!
    let url = URL(string: "https://www.spotify.com/signup")
    
    override func loadView() {
        webView = WKWebView()
        webView.backgroundColor = .webViewBackground
        webView.isOpaque = false
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        goToSite()
    }
    
    private func goToSite() {
        guard let url = url else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
        webView.allowsBackForwardNavigationGestures = true
    }
}

extension BrowserVC: WKNavigationDelegate {
    
}
