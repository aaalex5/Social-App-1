//
//  SideMenuVC.swift
//  Social-App
//
//  Created by Samy Ismail on 5/29/18.
//  Copyright © 2018 Alex Alajbegovic. All rights reserved.
//

import UIKit

class SideMenuVC: UITableViewController {

    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        switch indexPath.row {
        case 0: NotificationCenter.default.post(name: NSNotification.Name("ShowProfile"), object: nil)
        case 1: NotificationCenter.default.post(name: NSNotification.Name("ShowSettings"), object: nil)
        case 2: NotificationCenter.default.post(name: NSNotification.Name("ShowSignin"), object: nil)
            
        default: break
        }
    }

}
