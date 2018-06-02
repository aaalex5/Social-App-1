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
    
    //Outlets for sign in page
    @IBOutlet weak var selector: UISegmentedControl!
    @IBOutlet weak var signinLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    
    //Sign-in selector helper var
    var isSignIn:Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Sign in selector is an ACTION (it does something when used)
    @IBAction func selectorChanged(_ sender: UISegmentedControl) {
        //Flips the boolean of selector
        isSignIn = !isSignIn
        
        //Changes text of "signinLabel" depending on the selector bool
        if isSignIn {
            signinLabel.text = "Sign In"
            signinButton.setTitle("Sign in", for: .normal)
        } else {
            signinLabel.text = "Register"
            signinButton.setTitle("Register", for: .normal)
        }
    } //selectorChanged
    
    //Action for the sign in BUTTON
    @IBAction func signinButtonTapped(_ sender: UIButton) {
        //Create two const var for email and password grabbed from
        //the text fields for those
        if let email = emailTextField.text, let pass = passwordTextField.text {
            
            if isSignIn {
                //Firebase authentication command (ACCESS EXISTING USER)
                Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                    if let u = user {
                        // go to next page (user is found)
                        self.performSegue(withIdentifier: "GoToHome", sender: self)
                    } else {
                        // Check error and show message
                        }
                    }
                
            } else {
                //Firebase Auth command (CREATES a new user)
                Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                    if let u = user {
                        self.performSegue(withIdentifier: "GoToHome", sender: self)
                    } else {
                        // Check error and show message
                        }
                    }
                }
            } //if email and pass have a value
        
            } //signinButtonTapped
    
        }//ViewController
    


