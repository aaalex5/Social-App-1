//
//  MainVC.swift
//  Social-App
//
//  Created by Samy Ismail on 5/29/18.
//  Copyright © 2018 Alex Alajbegovic. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(showProfile), name: NSNotification.Name("ShowProfile"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(showSettings), name: NSNotification.Name("ShowSettings"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(showSignin), name: NSNotification.Name("ShowSignin"), object: nil)

    }
    
    @objc func showProfile(){
        performSegue(withIdentifier: "showProfile", sender: nil)
    }
    
    @objc func showSettings(){
        performSegue(withIdentifier: "showSettings", sender: nil)
    }
    
    @objc func showSignin(){
        performSegue(withIdentifier: "showSignin", sender: nil)
    }

    @IBAction func SideMenu(_ sender: UIBarButtonItem) {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    
}
