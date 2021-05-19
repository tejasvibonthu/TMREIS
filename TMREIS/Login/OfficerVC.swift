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
        if  loginValidationswithmobileNo(){
            self.OfficerLoginWS()
         }
//        iscitizen = false
//        UserDefaultVars.isCitizen = iscitizen
//        let vc = storyboards.Login.instance.instantiateViewController(withIdentifier: "OtpVC") as! OtpVC
//        self.navigationController?.pushViewController(vc, animated: true)
//        guard let vc = UIStoryboard(name: "Officer", bundle: nil).instantiateInitialViewController()else{return}
//
//        self.view.window?.rootViewController = vc
//        self.view.window?.becomeKey()
//        self.view.window?.makeKeyAndVisible()
//        let vc = storyboards.Officer.instance.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func OfficerLoginWS(){
        let username = mobileNumberTF.text?.AESEncryption()
        guard Reachability.isConnectedToNetwork() else {self.showAlert(message: noInternet);return}
        NetworkRequest.makeRequest(type: OfficerLoginStruct.self, urlRequest: Router.loginWithMobileNo(mobileNumber: username ?? "", deviceId: UserDefaultVars.deviceID ?? "", IMEI: UserDefaultVars.deviceID ?? "",fcmToken: UserDefaultVars.fcmToken ?? "" , deviceType: "IOS"), completion: { [weak self](result) in
                switch result{
                case  .success(let data):
                    // resetDefaults()
                    let statuscode = data.statusCode
                    switch statuscode
                    {
                    case 200 :
                        UserDefaults.standard.set(data.data.userID, forKey: "userId")
                        UserDefaultVars.userid = String(data.data.userID)
                        if data.data.mpin == "00" //mpin not set
                        {
                            let vc = self?.storyboard?.instantiateViewController(withIdentifier: "OtpVC") as! OtpVC

                            vc.otp = nullToNil(value: data.data.otpMobile) as? String

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
                        self?.showAlert(message: data.statusMessage )

                    default:
                        self?.showAlert(message: data.statusMessage )
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
        }
        return true
    }
}
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let officerLoginStruct = try? newJSONDecoder().decode(OfficerLoginStruct.self, from: jsonData)

import Foundation

// MARK: - OfficerLoginStruct
struct OfficerLoginStruct: Codable {
    let success: Bool
    let statusMessage: String
    let statusCode: Int
    let data: DataClass
    let paginated: Bool

    enum CodingKeys: String, CodingKey {
        case success
        case statusMessage = "status_Message"
        case statusCode = "status_Code"
        case data, paginated
    }
    // MARK: - DataClass
    struct DataClass: Codable {
        let employeeID, employeeName, designation, mobileNumber: String
        let gender: String
        let otpMobile: JSONNull?
        let userID: Int
        let userName, userType: String
        let photopath: String
        let bloodgroup: String
        let services: JSONNull?
        let location, token, fcmtoken, emailid: String
        let empID: Int
        let mpin: String

        enum CodingKeys: String, CodingKey {
            case employeeID = "employeeId"
            case employeeName, designation, mobileNumber, gender, otpMobile
            case userID = "userId"
            case userName, userType, photopath, bloodgroup, services, location, token, fcmtoken, emailid
            case empID = "empId"
            case mpin
        }
    }
}



// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
