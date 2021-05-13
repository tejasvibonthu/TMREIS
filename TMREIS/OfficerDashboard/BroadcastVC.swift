//
//  BroadcastVC.swift
//  TMREIS
//
//  Created by Haritej on 03/05/21.
//

import UIKit

class BroadcastVC: UIViewController,UITextViewDelegate {
    @IBOutlet weak var subjectTF: UITextField!
    @IBOutlet weak var textView: UITextView!
    {
        didSet
        {
            textView.delegate = self
            textView.text = "Remarks"
            textView.textColor = .lightGray
            textView.layer.cornerRadius = 5.0
            textView.layer.borderWidth = 1.0
            textView.layer.borderColor = UIColor.darkGray.cgColor
            textView.layer.masksToBounds = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.title = "Broadcast"
        setupBackButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        subjectTF.layer.borderWidth = 1
        subjectTF.layer.borderColor = UIColor(named: "Logogreen")?.cgColor
        
        textView.layer.borderColor = UIColor(named: "Logogreen")?.cgColor
        textView.layer.borderWidth = 1.0;
        textView.layer.cornerRadius = 5.0;
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray
        {
            textView.text = nil
            textView.textColor = .black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty
        {
            textView.text = "Message"
            textView.textColor = .lightGray
        }
    }
}
