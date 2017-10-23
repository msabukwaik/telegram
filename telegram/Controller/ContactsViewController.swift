//
//  ContactsViewController.swift
//  telegram
//
//  Created by Mohammed S A Kwaik on 10/21/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {

    @IBOutlet weak var contactsTableView:UITableView!
    var isSearchMode = false
    
    var contacts = ContactInfo.seed(withLength: 10)
    var filteredContacts = [ContactInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Contacts"
        self.tabBarController?.navigationItem.leftBarButtonItem = nil
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(plusButton))
        self.tabBarController?.navigationItem.titleView = nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    override func viewDidLayoutSubviews() {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc
    func plusButton()  {
        //TO-DO remve the following two lines
        contacts.append(contentsOf: ContactInfo.seed(withLength: 10))
        self.contactsTableView.reloadData()
    }
}

extension ContactsViewController:UITableViewDelegate{
    
}

extension ContactsViewController:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //first section
        if section == 0 && isSearchMode{
            return 1
        }else if section == 0{
            return 2
        }
        
        //2nd section
        if isSearchMode{
            return filteredContacts.count
        }else{
            return self.contacts.count
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchBarCellTableViewCell
                cell.searchBar.delegate = self
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoCell") as! MyContactInfoCellTableViewCell
                cell.contactProfile.layer.cornerRadius = cell.contactProfile.frame.size.width/2
                cell.contactProfile.clipsToBounds = true
                return cell
            }
        }else{
            if isSearchMode{
                let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell") as! ContactInfoCellTableViewCell
                cell.contactImage.image = filteredContacts[indexPath.row].image
                cell.ContactName.text = "\(filteredContacts[indexPath.row].first_name ?? "") \(filteredContacts[indexPath.row].last_name ?? "")"
                cell.ContactStatus.text = filteredContacts[indexPath.row].last_seen
                return cell
            }else{
            
                if indexPath.row == 0{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "InviteFriendsCell")!
                    return cell
                }else{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell") as! ContactInfoCellTableViewCell
                    cell.contactImage.image = contacts[indexPath.row - 1].image
                    cell.ContactName.text = "\(contacts[indexPath.row - 1].first_name ?? "") \(contacts[indexPath.row - 1].last_name ?? "")"
                    cell.ContactStatus.text = contacts[indexPath.row - 1].last_seen
                    return cell
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1{
            let view = UIView.init()
            view.backgroundColor = UIColor.init(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
            let label = UILabel.init()
            label.textColor = UIColor.init(red: 137/255, green: 137/255, blue: 138/255, alpha: 1)
            label.text = "CONTACTS"
            label.frame = CGRect(x: 15, y: 0, width: 100, height: 30)
            view.addSubview(label)
            return view
        }else{
            let view = UIView.init()
            view.frame.size = CGSize(width: 0, height: 0)
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }else{
            return 30
        }
    }
    
    
}

extension ContactsViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""{
            isSearchMode = false
            contactsTableView.reloadData()
        }else{
            isSearchMode = true
            for contact in contacts{
                if contact.first_name == searchBar.text || contact.last_name == searchBar.text{
                    filteredContacts.append(contact)
                }
            }
            contactsTableView.reloadData()
        }
    }
}

struct ContactInfo{
    var image:UIImage?
    var first_name:String?
    var last_name:String?
    var last_seen:String?
    var status:ContactStatus?
    
    init(image:UIImage?, first_name:String?, last_name:String?, last_seen:String?, status:ContactStatus?) {
        self.image = image
        self.first_name = first_name
        self.last_name = last_name
        self.last_seen = last_seen
        self.status = status
    }
    
    static func seed() -> ContactInfo {
        return ContactInfo.init(image: UIImage.init(named: "call"), first_name: "Sami", last_name: "Alhulwah", last_seen: "online", status: .online)
    }
    
    static func seed(withLength:Int? = 10) -> [ContactInfo] {
        
        var list:[ContactInfo] = [ContactInfo]()
        for _ in 0...withLength! {
            list.append(ContactInfo.seed())
        }
        return list
    }
}

enum ContactStatus:String {
    case online = "online"
}
