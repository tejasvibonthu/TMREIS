//
//  OfficerVC.swift
//  TMREIS
//
//  Created by deep chandan on 27/04/21.
//

import UIKit

class OfficerVC: UIViewController {
    var iscitizen:Bool = false
    @IBOutlet weak var mobileNumberTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func loginbtnClick(_ sender: Any) {
        iscitizen = false
        UserDefaultVars.isCitizen = iscitizen
        let vc = storyboards.Login.instance.instantiateViewController(withIdentifier: "OtpVC") as! OtpVC
        self.navigationController?.pushViewController(vc, animated: true)
//        guard let vc = UIStoryboard(name: "Officer", bundle: nil).instantiateInitialViewController()else{return}
//
//        self.view.window?.rootViewController = vc
//        self.view.window?.becomeKey()
//        self.view.window?.makeKeyAndVisible()
//        let vc = storyboards.Officer.instance.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
  

}
