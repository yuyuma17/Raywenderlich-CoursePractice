//
//  AboutViewController.swift
//  BullsEye
//
//  Created by 黃士軒 on 2019/9/9.
//  Copyright © 2019 黃士軒. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(webView)
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 1.5 + 100).isActive = true
        webView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 1.5).isActive = true
        webView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 3).isActive = true
        webView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @IBAction func backToMainScreen(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
