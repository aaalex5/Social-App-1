//
//  MainScreen.swift
//  Social-App
//
//  Created by Samy Ismail on 5/29/18.
//  Copyright © 2018 Alex Alajbegovic. All rights reserved.
//

import UIKit
import FirebaseAuth



class ContainerVC: UIViewController {
   
    
    
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    
    var sideMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu), name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    
    @objc func toggleSideMenu(){
        
        if sideMenuOpen{
            sideMenuOpen = false
            sideMenuConstraint.constant = -240
        }else{
            sideMenuOpen = true
            sideMenuConstraint.constant = 0
        }
        UIView.animate(withDuration: 0.3){
            self.view.layoutIfNeeded()
        }
        
    }
}
