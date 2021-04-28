//
//  Stroryboard.swift
//  TMREIS
//
//  Created by deep chandan on 27/04/21.
//

import Foundation
import UIKit
enum storyboards:String {
    case Main,Login,Dashboard
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}
var storyboardID : String {
    return "<Storyboard Identifier>"
}
