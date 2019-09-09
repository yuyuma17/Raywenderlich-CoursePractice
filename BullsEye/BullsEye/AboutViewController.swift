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

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: .init(x: 20, y: 20, width: 528, height: 235))
        self.view.addSubview(webView)
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    @IBAction func backToMainScreen(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
