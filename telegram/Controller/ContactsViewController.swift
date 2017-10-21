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
    
    override func viewDidLayoutSubviews() {
        userProfileImg.layer.cornerRadius = userProfileImg.frame.size.width / 2
        userProfileImg.layer.masksToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc
    func plusButton()  {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ContactsViewController:UITableViewDelegate{
    
}

extension ContactsViewController:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            return tableView.dequeueReusableCell(withIdentifier: "InviteFriendsCell")!
        }else{
            return tableView.dequeueReusableCell(withIdentifier: "ContactsCell")!
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "CONTACTS"
    }

}
