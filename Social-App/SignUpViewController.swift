//
//  SignUpViewController.swift
//  Social-App
//
//  Created by Alex Alajbegovic on 6/28/18.
//  Copyright © 2018 Alex Alajbegovic. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createUserBtn(_ sender: UIButton) {
        if let email = emailTextField.text, let pass = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                if let u = user {
                    print("User is created!")
                    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    changeRequest?.displayName = self.usernameTextField.text
                    changeRequest?.commitChanges { error in
                        if error == nil {
                            print("User display name changed!")
                        } else {
                            //Might not need this here
                            self.resetForm()
                        }
                    }
                    self.dismiss(animated: false, completion: nil)
                    
                } else {
                    // Check error and show message
                    print("Error creating user: \(error!.localizedDescription)")
                    self.resetForm()
                }
            }
        }
    }
    
    func resetForm() {
        //Alerts the person that this is invalid account for login
        let alert = UIAlertController(title: "Error signing up", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
