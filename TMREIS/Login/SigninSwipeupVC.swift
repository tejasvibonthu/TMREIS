//
//  LoginVC.swift
//  TMREIS
//
//  Created by deep chandan on 27/04/21.
//

import UIKit
import SwipeMenuViewController

class SigninSwipeupVC: UIViewController{
@IBOutlet weak var swipemenuView: SwipeMenuView!
    var options : SwipeMenuViewOptions = .init()
    var swipeTitles = ["CITIZEN" , "OFFICER"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.swipeMenuSetup()
    }
    func swipeMenuSetup()
    {
        swipemenuView.delegate = self
        swipemenuView.dataSource = self
        options.tabView.style = .segmented
        options.tabView.margin                          = 0.0
      //  options.tabView.additionView.backgroundColor    = UIColor(named: ThemeConstant.bgColor.getTheme())!
        options.tabView.backgroundColor                 = UIColor.groupTableViewBackground
        options.tabView.itemView.textColor              = UIColor.darkGray
        options.tabView.itemView.selectedTextColor      = UIColor.black
        options.tabView.itemView.font = UIFont.systemFont(ofSize: CGFloat(12.0))
        options.tabView.height = 40
        options.tabView.isSafeAreaEnabled = false

        swipemenuView.reloadData(options: options, default: 0, isOrientationChange: false)

    }
    
}
extension SigninSwipeupVC:SwipeMenuViewDelegate,SwipeMenuViewDataSource{
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        if index == 0

        {
            let vc = storyboards.Login.instance.instantiateViewController(withIdentifier: "CitizenVC") as! CitizenVC
            addChild(vc)
            return vc
        }
        let vc = storyboards.Login.instance.instantiateViewController(withIdentifier: "OfficerVC") as! OfficerVC
         addChild(vc)
        return vc
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        return swipeTitles[index]
    }
    
    func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return swipeTitles.count
    }
    
    
}
