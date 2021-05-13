//
//  AddmemberVC.swift
//  TMREIS
//
//  Created by Haritej on 03/05/21.
//

import UIKit

class AddmemberVC: UIViewController {

    @IBOutlet weak var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.title = "Add member"
        
        
        setupBackButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        mainView.layer.cornerRadius = 5
        mainView.layer.borderWidth = 0.5
        mainView.layer.borderColor = UIColor(named: "Logogreen")?.cgColor
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true

    }

}
