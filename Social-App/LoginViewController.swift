//
//  LoginViewController.swift
//  Social-App
//
//  Created by Alex Alajbegovic on 6/28/18.
//  Copyright © 2018 Alex Alajbegovic. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signinBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        if let email = emailTextField.text, let pass = passwordTextField.text {
            //Firebase authentication command (ACCESS EXISTING USER)
            Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                if let u = user {
                    // go to next page (user is found)
                    //Look up what .dismiss function does (it works but like idk how)
                    self.dismiss(animated: false, completion: nil)
                } else {
                    // Check error and show message
                    print("Error logging in user: \(error!.localizedDescription)")
                }
            }
        }
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
