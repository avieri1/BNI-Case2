//
//  DetailVC.swift
//  case2
//
//  Created by aldo on 01/02/24.
//

import Foundation
import UIKit
import WebKit

protocol AnyDetailView {
    var presenter: AnyDetailPresenter? { get set }
    
    func show(with detailLink: String)
}

class DetailVC: UIViewController, AnyDetailView, WKNavigationDelegate {
    var presenter: AnyDetailPresenter?
    
    var webView: WKWebView!
    
    func show(with detailLink: String) {
        DispatchQueue.main.async {
            self.webView.load(URLRequest(url: detailLink.asUrl!))
        }
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modalPresentationStyle = .overFullScreen

    }
    
}

