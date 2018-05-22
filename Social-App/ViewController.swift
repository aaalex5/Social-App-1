//
//  ViewController.swift
//  Social-App
//
//  Created by Alex Alajbegovic on 5/14/18.
//  Copyright © 2018 Alex Alajbegovic. All rights reserved.
//

import UIKit
import FirebaseAuth


class ViewController: UIViewController {

    @IBOutlet weak var selector: UISegmentedControl!
    
    @IBOutlet weak var signinLabel: UILabel!
   
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signinButton: UIButton!
    
    var isSignIn:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func selectorChanged(_ sender: UISegmentedControl) {
        isSignIn = !isSignIn
        
        if isSignIn {
            signinLabel.text = "Sign In"
            signinButton.setTitle("Sign in", for: .normal)
        }
        
        else{
            signinLabel.text = "Register"
            signinButton.setTitle("Register", for: .normal)
        }
    }
    
    @IBAction func signinButtonTapped(_ sender: UIButton) {
        if let email = emailTextField.text, let pass = passwordTextField.text{
            if isSignIn{
                Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                    if let u = user {
                        // go to next page
                        self.performSegue(withIdentifier: "GoToHome", sender: self)
                    }
                    else {
                        // Check error and show message
                    }
                    }
                
            }
            else {
                Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                    if let u = user {
                        self.performSegue(withIdentifier: "GoToHome", sender: self)
                    }
                    else {
                        // Check error and show message
                    }
                }
                }
            }
           
                
            }
        }
    


