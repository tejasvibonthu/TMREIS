//
//  CitizenVC.swift
//  TMREIS
//
//  Created by deep chandan on 27/04/21.
//

import UIKit

class CitizenVC: UIViewController {
    var iscitizen:Bool = true
    var deviceIdIs:String?
    @IBOutlet weak var mobileNumberTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    


    @IBAction func loginbtnClick(_ sender: Any) {
        guard let deviceID = UIDevice.current.identifierForVendor?.uuidString else {
            return
        }
        self.deviceIdIs = deviceID
        iscitizen = true
        UserDefaults.standard.setValue(iscitizen, forKey: "isCitizen")
        UserDefaultVars.isCitizen = iscitizen
        self.citizenLogin()

//       if  loginValidationswithmobileNo(){
//            //self.citizenLogin()
//        }
        
        let vc = storyboards.Login.instance.instantiateViewController(withIdentifier: "OtpVC") as! OtpVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func citizenLogin(){
          //  UserDefaults.standard.set(mo.text, forKey:"mobileNumber")
        let username = mobileNumberTF.text?.AESEncryption()
        let password = "guest".AESEncryption() ?? ""
   
        guard Reachability.isConnectedToNetwork() else {self.showAlert(message: noInternet);return}
        NetworkRequest.makeRequest(type: LoginModel.self, urlRequest: Router.loginWithMobileNo(mobileNumber: username ?? "",password: password ,userName: username ?? "", deviceId: self.deviceIdIs ?? "", IMEI: self.deviceIdIs ?? "",fcmToken: UserDefaultVars.fcmToken ?? "" , deviceType: "IOS"), completion: { [weak self](result) in
                switch result{
                case  .success(let data):
                    // resetDefaults()
                    let statuscode = data.status_Code
                    switch statuscode
                    {
                    case 200 :
                        
                        guard let userId = data.data?.userId else {return}
                                UserDefaults.standard.set(userId, forKey: "userId")
                        UserDefaultVars.userid = String(userId)
                        if data.data?.mpin == "00" //mpin not set
                        {
                            let vc = self?.storyboard?.instantiateViewController(withIdentifier: "OtpVC") as! OtpVC
                            vc.otp = data.data?.otpMobile ?? ""
                          //  vc.mobileNumber = self?.usernameTxt.text!
                           // vc.tag = 2
                            self?.navigationController?.pushViewController(vc, animated: true)
                        }
                        else //mpin set
                        {
                            let vc = self?.storyboard?.instantiateViewController(withIdentifier: "UpdateMpinVC") as! UpdateMpinVC
                            self?.navigationController?.pushViewController(vc, animated: true)
                            
                        }
                    case 201: //error message
                        self?.showAlert(message: data.status_Message ?? serverNotResponding)
                   
                    default:
                        self?.showAlert(message: data.status_Message ?? serverNotResponding)
                    }
                    
                case .failure(let err):
                    print(err)
                    self?.showAlert(message: serverNotResponding)
                    
                }
                
            })
            
        
    }
    func loginValidationswithmobileNo()->Bool {
        if  mobileNumberTF.text == ""{
            self.showAlert(message: "Please enter mobile number")
            
            return false
        }
        else if mobileNumberTF.text?.count != 10
        {
            self.showAlert(message: "Please enter valid mobile number")
            return false
        } else if passwordTF.text == ""{
            self.showAlert(message: "Please enter password")
        }
        return true
    }
}

struct LoginModel : Codable {
    let success : Bool?
    let status_Message : String?
    let status_Code : Int?
    let data : LoginData?
    let paginated : Bool?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case status_Message = "status_Message"
        case status_Code = "status_Code"
        case data = "data"
        case paginated = "paginated"
    }


    struct LoginData : Codable {
        let employeeId : String?
        let postId : String?
        let employeeName : String?
        let designation : String?
        let mobileNumber : String?
        let gender : String?
        let otpMobile : String?
        let name : String?
        let userId : Int?
        let userName : String?
        let photopath : String?
        let bloodgroup :String?
       // let services : [String]?
        let location : String?
        let token : String?
        let mpin : String?
        let empId : Int?
        let fcmtoken : String?
        let emailId : String?

        enum CodingKeys: String, CodingKey {

            case employeeId = "employeeId"
            case postId = "postId"
            case employeeName = "employeeName"
            case designation = "designation"
            case mobileNumber = "mobileNumber"
            case gender = "gender"
            case otpMobile = "otpMobile"
            case name = "name"
            case userId = "userId"
            case userName = "userName"
            case photopath = "photopath"
         //   case services = "services"
            case location = "location"
            case token = "token"
            case mpin = "mpin"
            case empId = "empId"
            case fcmtoken = "fcmtoken"
            case bloodgroup = "bloodgroup"
            case emailId = "emailid"
        }



    }


}

