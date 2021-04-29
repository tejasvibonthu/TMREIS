//
//  CitizenVC.swift
//  TMREIS
//
//  Created by deep chandan on 27/04/21.
//

import UIKit

class CitizenVC: UIViewController {
    var iscitizen:Bool = true
    @IBOutlet weak var mobileNumberTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    


    @IBAction func loginbtnClick(_ sender: Any) {
        iscitizen = true
        UserDefaults.standard.setValue(iscitizen, forKey: "isCitizen")
        UserDefaultVars.isCitizen = iscitizen
//       if  loginValidationswithmobileNo(){
//            //self.citizenLogin()
//        }
        
        let vc = storyboards.Login.instance.instantiateViewController(withIdentifier: "OtpVC") as! OtpVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
//    func citizenLogin(){
//        let username = usernameTxt.text?.AESEncryption()
//        let password = passwordTxt.text?.AESEncryption()
//        //LIve Appstore
////        if usernameTxt.text == "deepchandan.a"
////        {
////            username = "deepchandan.a"
////            password = passwordTxt.text
////
////        }
//        UserDefaults.standard.set(passwordTxt.text, forKey:"password")
//        UserDefaults.standard.set(deviceIdIs, forKey:"deviceId")
 //   guard Reachability.isConnectedToNetwork() else {self.showFailureAlert(message: noInternet);return}
//        NetworkRequest.makeRequest(type: LoginModel.self, urlRequest: Router.login(username: username ?? "", password: password ?? "", deviceId: self.deviceIdIs ?? "", IMEI: self.deviceIdIs ?? "" , fcmToken: UserDefaultVars.fcmKey ?? "", deviceType: "IOS"), completion: { [weak self](result) in
//            switch result{
//            case  .success(let data):
//                let statuscode = data.status_Code
//                switch statuscode
//                {
//                case 200 :
//                    self?.saveToUserDefaults(data: data)
//                    if data.data?.mpin == "00" //mpin not set
//                    {
//                        let vc = self?.storyboard?.instantiateViewController(withIdentifier: "OtpViewController") as! OtpViewController
//
//                        vc.otp = data.data?.otpMobile
//                        vc.password = self?.passwordTxt.text!
//                        vc.username = self?.usernameTxt.text!
//                        vc.tag = 1
//                        self?.navigationController?.pushViewController(vc, animated: true)
//                    }
//                    else //mpin set
//                    {
//                        let vc = self?.storyboard?.instantiateViewController(withIdentifier: "WelcomeMPINViewController") as! WelcomeMPINViewController
//                        self?.navigationController?.pushViewController(vc, animated: true)
//
//                    }
//                case 201: //error message
//                    self?.showInfoAlert(message: data.status_Message ?? serverNotResponding)
//                case 205: // exceeded the max of 3 devices
//                    self?.showInfoAlert(message: data.status_Message!)
//                    {
//                        self?.deviceRegistration(userName: self!.usernameTxt.text!, isReset: "true")
//                    }
//                case 403: // device registered  for another user
//                    self?.showInfoAlert(message: data.status_Message!)
//                case 426: //device not registered want to add for trusted devices
//                    self?.showInfoAlert(message: data.status_Message!)
//                    {
//                        self?.deviceRegistration(userName: self!.usernameTxt.text!, isReset: "false")
//                    }
//                default:
//                    self?.showInfoAlert(message: data.status_Message ?? serverNotResponding)
//                }
//
//            case .failure(let err):
//                print(err)
//                self?.showFailureAlert(message: serverNotResponding)
//            }
//
//        })
//
//    }
    func loginValidationswithmobileNo()->Bool {
        if  mobileNumberTF.text == ""{
            self.showAlert(message: "Please enter mobile number")
            
            return false
        }
        else if mobileNumberTF.text?.count != 10
        {
            self.showAlert(message: "Please enter valid mobile number")
            return false
        }
        return true
    }
}
