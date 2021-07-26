//
//  CitizenDashboardForm.swift
//  TMREIS
//
//  Created by deep chandan on 27/04/21.
//

import UIKit
import WebKit
class CitizenDashboardFormVC: UIViewController {
    private let webView = WKWebView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TMREIS"
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.backItem?.title = " "
        webView.translatesAutoresizingMaskIntoConstraints = false
             self.view.addSubview(self.webView)
          // You can set constant space for Left, Right, Top and Bottom Anchors
                              NSLayoutConstraint.activate([
                                  self.webView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
                                  self.webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                                  self.webView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
                                  self.webView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                  ])
              self.view.setNeedsLayout()
        let request = URLRequest(url: URL.init(string: "https://tmreis.cgg.gov.in/Login.do")!)
              self.webView.load(request)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.backItem?.title = " "

    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.backItem?.title = " "

    }
}
