//
//  CallsViewController.swift
//  telegram
//
//  Created by Mohammed S A Kwaik on 10/21/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//

import UIKit

class CallsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Calls"
        self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "Edit", style: .plain, target: self, action: #selector(editButton))
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "call"), style: .plain, target: self, action: #selector(callButton))
        let items = ["All", "Missed"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0
        self.tabBarController?.navigationItem.titleView = customSC
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc
    func callButton()  {
        
    }
    
    @objc
    func editButton()  {
        
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
