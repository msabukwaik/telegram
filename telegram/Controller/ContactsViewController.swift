//
//  ContactsViewController.swift
//  telegram
//
//  Created by Mohammed S A Kwaik on 10/21/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {

    @IBOutlet weak var userProfileImg: UIImageView!
    @IBOutlet weak var contactsTableView:UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var contactTableViewHeightConstraint: NSLayoutConstraint!
    
    var contacts = ContactInfo.seed(withLength: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTableView.isScrollEnabled = false
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init()
        view.backgroundColor = UIColor.init(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        let label = UILabel.init()
        label.textColor = UIColor.init(red: 137/255, green: 137/255, blue: 138/255, alpha: 1)
        label.text = "CONTACTS"
        label.frame = CGRect(x: 15, y: 0, width: 100, height: 30)
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Contacts"
        self.tabBarController?.navigationItem.leftBarButtonItem = nil
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(plusButton))
        self.tabBarController?.navigationItem.titleView = nil
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        contactTableViewHeightConstraint.constant =  ceil(contactsTableView.contentSize.height)
        self.contactsTableView.layoutIfNeeded()
    }
    
    override func viewDidLayoutSubviews() {
        userProfileImg.layer.cornerRadius = userProfileImg.frame.size.width / 2
        userProfileImg.layer.masksToBounds = true
        
        contactTableViewHeightConstraint.constant =  ceil(contactsTableView.contentSize.height)
        self.contactsTableView.layoutIfNeeded()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc
    func plusButton()  {
        //TO-DO remve the following two lines
        contacts.append(contentsOf: ContactInfo.seed(withLength: 10))
        self.contactsTableView.reloadData()
        contactTableViewHeightConstraint.constant =  ceil(contactsTableView.contentSize.height)
        self.contactsTableView.layoutIfNeeded()
    }
}

extension ContactsViewController:UITableViewDelegate{
    
}

extension ContactsViewController:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            return tableView.dequeueReusableCell(withIdentifier: "InviteFriendsCell")!
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell") as! ContactInfoCellTableViewCell
            cell.contactImage.image = contacts[indexPath.row - 1].image
            cell.ContactName.text = "\(contacts[indexPath.row - 1].first_name ?? "") \(contacts[indexPath.row - 1].last_name ?? "")"
            cell.ContactStatus.text = contacts[indexPath.row - 1].last_seen
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
