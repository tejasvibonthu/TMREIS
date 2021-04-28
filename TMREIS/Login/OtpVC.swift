//
//  OtpVC.swift
//  TMREIS
//
//  Created by deep chandan on 27/04/21.
//

import UIKit

class OtpVC: UIViewController {

    @IBOutlet weak var otpTF: UITextField!
    @IBOutlet weak var mobilenoLb: UILabel!
    var otp = "111111"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

    }
    
    @IBAction func resendotpBtnClick(_ sender: Any) {
    }
    
    @IBAction func submitBtnClick(_ sender: Any) {
        if self.otpTF.text?.count == 6
        {
            if(self.otp == otpTF.text){
                //print (otpstackView.getOTP())
                
                let vc = storyboards.Login.instance.instantiateViewController(withIdentifier: "SetMpinVC") as! SetMpinVC
                self.navigationController?.pushViewController(vc, animated: true)
            } else{
                self.showAlert(message: "Entered otp is wrong")
            }
        }else{
            self.showAlert(message: "Please Enter 6 digit otp")
        }
        
    }
    //MARK:- Service Calls
//    func LoginWSwithUserName() {
//       // print(UserDefaultVars.username , password)
   // guard Reachability.isConnectedToNetwork() else {self.showFailureAlert(message: noInternet);return}
//        NetworkRequest.makeRequest(type: LoginModel.self, urlRequest: Router.login(username:username?.AESEncryption() ?? "", password: password?.AESEncryption() ?? "", deviceId: UserDefaultVars.deviceID ?? "", IMEI: UserDefaultVars.deviceID ?? "",fcmToken: UserDefaultVars.fcmKey ?? "", deviceType: "IOS"), completion: { [weak self](result) in
//               switch result{
//               case  .success(let data):
//                   self?.model = data
//                   let statuscode = data.status_Code
//                   let mpin = data.data?.mpin
//                   let userName = data.data?.userName
//                   UserDefaults.standard.set(userName, forKey:"userName")
//                   if statuscode == 200 && mpin == "00" {
//                        self?.showSuccessAlert(message: data.status_Message ?? "")
//                        self?.otp = data.data?.otpMobile
//                   } else{
//                    self?.showFailureAlert(message: data.status_Message ?? serverNotResponding)
//                }
//               case .failure(let err):
//                   print(err)
//                   self?.showFailureAlert(message: serverNotResponding)
//
//               }
//
//           })
//
//       }
}
