//
//  HomeVC.swift
//  TMREIS
//
//  Created by deep chandan on 29/04/21.
//

import UIKit
import SDWebImage
import Floaty
class HomeVC: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    var getContactDetailsModel:ContactDetailsStruct?
    var filteredContactArray : [ContactDetailsStruct.Contact]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
      //  collectionView.delegate = self
       // collectionView.dataSource = self
        self.addFilterButton()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        
    }
    @IBAction func menubtnClick(_ sender: Any) {
        sideMenuController?.revealMenu()
    }
    func addFilterButton(){
        let floaty = Floaty()
        floaty.buttonImage = UIImage(named: "plus")
        floaty.itemTitleColor = .green
        floaty.buttonColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        floaty.overlayColor = UIColor.white.withAlphaComponent(0.8)
        floaty.plusColor = .white
        floaty.addItem("", icon: UIImage(named: "addmember")!, handler: {[unowned self] item in
            let vc = storyboards.Officer.instance.instantiateViewController(withIdentifier: "AddmemberVC") as! AddmemberVC
            self.navigationController?.pushViewController(vc, animated: true)//            self.tableViewDataSource = self.reports?.filter { $0.pendingApprove == "2"}
//            self.tableView.reloadData()
            
        })
        floaty.addItem("", icon: UIImage(named: "broadcast")!, handler: {[unowned self]  item in
            let vc = storyboards.Officer.instance.instantiateViewController(withIdentifier: "BroadcastVC") as! BroadcastVC
            self.navigationController?.pushViewController(vc, animated: true)//
//            self.tableViewDataSource = self.reports?.filter { $0.pendingApprove == "1"}
//            // print(self.tableViewDataSource?.count)
//            self.tableView.reloadData()
        })
        
        floaty.items.forEach { (item) in
            switch item.icon {
            case   UIImage(named: "addmember"):
                item.titleColor =  .green
                // item.titleLabel.backgroundColor = .green
                item.titleLabel.font = UIFont.systemFont(ofSize: 14.0)
                item.icon = UIImage(named: "broadcast")
                item.hasShadow = false
                item.titleLabel.textAlignment = .right
                item.buttonColor = .systemPink
            case UIImage(named: "broadcast"):
                item.titleColor = UIColor.darkGray
                // item.titleLabel.backgroundColor = .green
                item.titleLabel.font = UIFont.systemFont(ofSize: 14.0)
                item.icon = UIImage(named: "broadcast")
                item.hasShadow = false
                item.titleLabel.textAlignment = .right
                item.buttonColor = .systemPink

            case .none:
                print("")
            case .some(_):
                print("")
            }
        }
        self.view.addSubview(floaty)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredContactArray?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactsCell", for: indexPath) as! ContactsCell
        let contact = filteredContactArray?[indexPath.row]
        cell.nameLb.numberOfLines = 0
        cell.nameLb.text = contact?.empName
        let placeHolderImage = contact?.gender == "M" ? UIImage(named: "man") : UIImage(named: "women")
        guard contact?.photopath != "" else {return cell}
        if let picUrl = URL(string: (contact?.photopath?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))!)
        {
            cell.profileImg.sd_setImage(with: picUrl, placeholderImage: placeHolderImage)
        }else{
             cell.profileImg.image = placeHolderImage
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(self.filteredContactArray![indexPath.row])
        self.view.endEditing(true)
        let vc = storyboards.Officer.instance.instantiateViewController(withIdentifier: "SinglecontactDetailsVC") as! SinglecontactDetailsVC
        vc.contactDetails = self.filteredContactArray![indexPath.row]
       // vc.modalPresentationStyle = .pop
        vc.modalPresentationStyle = .formSheet
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true, completion: nil)
    }
    func getContactDetails(){
        guard Reachability.isConnectedToNetwork() else {self.showAlert(message: noInternet);return}
        NetworkRequest.makeRequest(type: ContactDetailsStruct.self, urlRequest: Router.getContactDetails) { [weak self](result) in
            switch result
            {
            case .success(let contactDetails):
               
                if contactDetails.success == true{
//                    if contactDetails.statusCode == 401
//                    {
//                        self?.showSessionExpiryAlert()
//                    }
                    guard let data = contactDetails.data else {return}
                     if (!(data.isEmpty)){
                        DispatchQueue.main.async {
                            self?.getContactDetailsModel = contactDetails
                           // self?.contactsArray = contactDetails.data
                            self?.filteredContactArray = contactDetails.data?.sorted(by: { (cont1, cont2) -> Bool in
                                return cont1.empName! < cont2.empName!
                            })
                                self?.collectionView.reloadData()
                        }
                    }else {
                        self?.showAlert(message:"No records found") {
                          //  self?.backButtonPressed()
                        }
                    }
                }  else{
                    self?.showAlert(message:"Something went wrong") {
                       // self?.backButtonPressed()
                    }
                }
            case .failure(let err):
                print(err)
                DispatchQueue.main.async {
                    self?.showAlert(message: serverNotResponding)
                }
            }
        }
    }
}
extension HomeVC:UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        self.view.endEditing(true)
        UIView.animate(withDuration: 0.250) {
            self.view.layoutIfNeeded()
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty  else { filteredContactArray = getContactDetailsModel?.data; return }
        filteredContactArray = getContactDetailsModel?.data?.filter({ user -> Bool in
                return user.empName!.lowercased().contains(searchText.lowercased())
            })
            collectionView.reloadData()
        }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }//
}
struct ContactDetailsStruct: Codable {
    let success: Bool?
    let statusMessage: String?
    let statusCode: Int?
    let data: [Contact]?
    let paginated: Bool?
    
    enum CodingKeys: String, CodingKey {
        case success
        case statusMessage = "status_Message"
        case statusCode = "status_Code"
        case data, paginated
    }
    // MARK: - Datum
    struct Contact: Codable , Hashable {
        let emailID: String?
        let roName: String?
        let gender: String?
        let groupName, extNo: String?
        let photopath: String?
        let employeeID, empName, mobileNo: String?
        let bloodGroup: String?
        let empDesignation: String?
        
        enum CodingKeys: String, CodingKey {
            case emailID = "email_id"
            case roName = "ro_name"
            case gender
            case groupName = "group_name"
            case extNo = "ext_no"
            case photopath
            case employeeID = "employee_Id"
            case empName = "emp_name"
            case mobileNo = "mobile_no"
            case bloodGroup = "blood_group"
            case empDesignation = "emp_designation"
        }
    }
}

