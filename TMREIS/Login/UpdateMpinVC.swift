//
//  UpdateMpinVC.swift
//  TMREIS
//
//  Created by deep chandan on 27/04/21.
//

import UIKit

class UpdateMpinVC: UIViewController {
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var mpinView: UIView!
    let mpinstackView = OTPStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        setupMpinStackView()
        
    }
    func setupMpinStackView()
    {
        mpinView.backgroundColor = .clear
        mpinView.addSubview(mpinstackView)
        mpinstackView.heightAnchor.constraint(equalTo: mpinView.heightAnchor).isActive = true
        mpinstackView.centerXAnchor.constraint(equalTo: mpinView.centerXAnchor).isActive = true
        mpinstackView.centerYAnchor.constraint(equalTo: mpinView.centerYAnchor).isActive = true
    }

    @IBAction func notuBtnClick(_ sender: Any) {
        let  vc = storyboards.Login.instance.instantiateViewController(withIdentifier: "SigninSwipeupVC") as! SigninSwipeupVC
        self.navigationController?.pushViewController(vc, animated: true)
        resetDefaults()
    }
    @IBAction func forgotmpinClick(_ sender: Any) {
       // self.forgotMpinWS()
    }
    
    @IBAction func mpinValidateBtnClick(_ sender: Any) {
       // self.validateMpinWS()
        print(UserDefaultVars.isCitizen)
        if UserDefaultVars.isCitizen == true {
            let vc = storyboards.Dashboard.instance.instantiateViewController(withIdentifier: "CitizenDashboardVC") as! CitizenDashboardVC
            self.navigationController?.pushViewController(vc, animated: true)
    } else {

        guard let vc = UIStoryboard(name: "Officer", bundle: nil).instantiateInitialViewController()else{return}

        self.view.window?.rootViewController = vc
        self.view.window?.becomeKey()
        self.view.window?.makeKeyAndVisible()
    }
    }
//    func validateMpinWS(){
//        let mpin = self.mpinstackView.getOTP().AESEncryption()
//guard Reachability.isConnectedToNetwork() else {self.showFailureAlert(message: noInternet);return}
//        NetworkRequest.makeRequest(type: mpinValidation.self, urlRequest: Router.validateMpin(userId: self.userId ?? "", mpin: mpin ?? "", fcmToken: UserDefaultVars.fcmKey ?? "")) { [weak self](result) in
//
//            switch result{
//            case .success(let data):
//               // self?.mpinmodel = data
//                print(data)
//                guard let statusCode = data.status_Code else {return}
//
//                switch statusCode {
//                case 200:
//                    UserDefaultVars.RolesArray = data.data ?? []
//
//                        guard let vc = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController()else{return}
//
//                        self?.view.window?.rootViewController = vc
//                        self?.view.window?.becomeKey()
//                        self?.view.window?.makeKeyAndVisible()
//                case 201:
//                    //  print("worklog not submitted")
//                    self?.showFailureAlert(message: data.status_Message ?? serverNotResponding)
//                case 401:
//                    self?.showFailureAlert(message: "Session Expired , Please login again!", okCompletion: {
//                        let vc = storyboards.Main.instance.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//                        let navCOntroller = UINavigationController(rootViewController: vc)
//                        navCOntroller.navigationBar.isHidden = true
//                        self?.view.window?.rootViewController = navCOntroller
//                        self?.view.window?.becomeKey()
//                         self?.view.window?.makeKeyAndVisible()
//                    })
//
//                default:
//                    print("default")
//                    self?.showFailureAlert(message: serverNotResponding)
//
//                }
//            // print(attendanceInfo)
//            case .failure(let _err):
//                print(_err)
//                self?.showFailureAlert(message: serverNotResponding)
//            }
//        }
//    }
//    func forgotMpinWS(){
 //   guard Reachability.isConnectedToNetwork() else {self.showFailureAlert(message: noInternet);return}
//        NetworkRequest.makeRequest(type:Mpinmodel.self, urlRequest: Router.forgotMpin(userName: UserDefaultVars.username, mpin: UserDefaultVars.mpin), completion: { [weak self](result) in
//            switch result{
//            case  .success(let data):
//                self?.model = data
//                let statusCode = data.statusCode
//                print(data)
//                if statusCode == 200 {
//                    let refreshAlert = UIAlertController(title: "Virtuo", message:data.statusMessage ?? "", preferredStyle: UIAlertController.Style.alert)
//
//                    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
//                      let vc = self?.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//                        self?.navigationController?.pushViewController(vc, animated: true)
//                        
//                    }))
//                 self?.present(refreshAlert, animated: true, completion: nil)
//                 
//
//                } else if data.statusCode == 401 {
//                    self?.showFailureAlert(message: "Session Expired , Please login again!",
//                    okCompletion: {
//                        // resetDefaults()
//                        let vc = storyboards.Main.instance.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//                        let navCOntroller = UINavigationController(rootViewController: vc)
//                        navCOntroller.navigationBar.isHidden = true
//                        self?.view.window?.rootViewController = navCOntroller
//                        self?.view.window?.becomeKey()
//                    })
//                }else {
//                    self?.showFailureAlert(message:data.statusMessage ?? serverNotResponding)
//              }
//            case .failure(let _err):
//                 print(_err)
//                self?.showFailureAlert(message: "server not responding")
//            }
//
//        })
//    }

}
