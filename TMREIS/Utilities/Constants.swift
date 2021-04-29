//
//  Constants.swift
//  TMREIS
//
//  Created by deep chandan on 27/04/21.
//

import Foundation
import UIKit
struct UserDefaultVars {
    static var RolesArray : [String] = []
    static var isCitizen = UserDefaults.standard.value(forKey: "iscitizen") as? Bool
//    static var deviceID = UIDevice.current.identifierForVendor?.uuidString
//    static var ImeiNo = UIDevice.current.identifierForVendor?.uuidString
//    static var empID = UserDefaults.standard.value(forKey: "empID") as! String
//    static var employeeName = UserDefaults.standard.value(forKey:"employeeName") as! String
//    static var Designation =  UserDefaults.standard.value(forKey:"designation") as! String
//    static var mobileNum = UserDefaults.standard.value(forKey:"mobileNumber") as! String
//    static var photoPath = UserDefaults.standard.value(forKey:"photopath") as! String
//    static var token = UserDefaults.standard.value(forKey:"token") as? String
//    static var mpin = UserDefaults.standard.value(forKey:"mpin") as! String
//    static var username = UserDefaults.standard.value(forKey:"email") as! String
//    static var gender = UserDefaults.standard.value(forKey: "gender") as! String
//    static var role = UserDefaults.standard.value(forKey: "fdorRole") as! String
//    static var fcmKey = UserDefaults.standard.value(forKey: "fcmToken") as? String
//    static var bloodGroup = UserDefaults.standard.value(forKey: "bloodGroup") as? String
//    static var maxTimeCheck = UserDefaults.standard.value(forKey: "max_time_chk") as? String
    
}
extension UIViewController {
    func showAlert(message: String , completion : (()->())? = nil)
    {
        let alert = UIAlertController(title: "TMRIES", message:message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            completion?()
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func resetDefaults() {
        
        let defaults = UserDefaults.standard
        //deleteAllData("LocationMaster")
       // deleteAllData("PTMSMaster")
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
//            if key != UserDefaultVars.empRefID//delete all userdefault values except locationMasterData
//            {
//                defaults.removeObject(forKey: key)
//            }
            
        }
        
    }
    
}
