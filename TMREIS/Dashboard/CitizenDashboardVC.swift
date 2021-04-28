//
//  CitizenDashboardVC.swift
//  TMREIS
//
//  Created by deep chandan on 27/04/21.
//

import UIKit

class CitizenDashboardVC: UIViewController {
        @IBOutlet weak var formView: UIView!
        override func viewDidLoad() {
        super.viewDidLoad()
     let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        formView.addGestureRecognizer(tap)
        formView.isUserInteractionEnabled = true
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        // print("Hello World")
        let vc = storyboards.Dashboard.instance.instantiateViewController(withIdentifier: "CitizenDashboardFormVC") as! CitizenDashboardFormVC
        self.navigationController?.pushViewController(vc, animated: true)
      }

}
