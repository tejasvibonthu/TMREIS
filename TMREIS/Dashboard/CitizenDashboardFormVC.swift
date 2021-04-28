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
        var request = URLRequest(url: URL.init(string: "https://tmreis.cgg.gov.in/Login.do")!)
              self.webView.load(request)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
