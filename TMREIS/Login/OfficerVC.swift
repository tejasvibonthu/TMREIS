//
//  OfficerVC.swift
//  TMREIS
//
//  Created by deep chandan on 27/04/21.
//

import UIKit

class OfficerVC: UIViewController {

    @IBOutlet weak var mobileNumberTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func loginbtnClick(_ sender: Any) {
        let vc = storyboards.Dashboard.instance.instantiateViewController(withIdentifier: "OfficerDashboardVC") as! OfficerDashboardVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
  

}
