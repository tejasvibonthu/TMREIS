//
//  OTPTextField.swift
//  TMREIS
//
//  Created by deep chandan on 27/04/21.
//

import Foundation
import UIKit
class OTPTextField: UITextField {
    
    weak var previousTextField: OTPTextField?
    weak var nextTextField: OTPTextField?
    
    override public func deleteBackward(){
        text = ""
        previousTextField?.becomeFirstResponder()
    }
    
}
