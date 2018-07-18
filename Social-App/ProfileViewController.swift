//
//  ProfileViewController.swift
//  Social-App
//
//  Created by Alex Alajbegovic on 6/28/18.
//  Copyright © 2018 Alex Alajbegovic. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class ProfileViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var changeProfileBtn: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let image = profileImage.image else { return }
        
        // Do any additional setup after loading the view.
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        changeProfileBtn.addTarget(self, action: #selector(openImagePicker), for: .touchUpInside)
        
        //1. Upload the profile image to Firebase Storage
        //takes the url image data and we can save it now to the database
        self.uploadProfileImage(image) { url in
            
            //idk if this is gonna work...
            if url.absoluteString != "" {
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.photoURL = url
                changeRequest?.commitChanges { error in
                    if error == nil {
                        print("User photo image changed!")
                        
                        self.saveProfile(profileImageURL: url) { success in
                            if success {
                                self.dismiss(animated: true, completion: nil)
                            }
                        }
                        
                        //self.dismiss(animated: false, completion: nil)
                    } else {
                        print("Error: \(error!.localizedDescription)")
                    }
                }
            }
        }
        
        //2. Save the profile data to Firebase Database
        
        //3. Dismiss the view
        
    }
    
    //Following 2nd tutorial atm
    
    func uploadProfileImage (_ image:UIImage, completion: @escaping ((_ url:URL)->())) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let storageRef = Storage.storage().reference().child("user/\(uid)")
        
        guard let imageData = UIImageJPEGRepresentation(image, 0.75) else { return }
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        storageRef.putData(imageData, metadata: metaData) { metaData, error in
            if error == nil, metaData != nil {
                if let url = metaData?.downloadURL() {
                    completion(url)
                } else {
                    //I'm not so sure this works, but we can see...
                    completion(nil! as URL)
                }
                //success!
            } else {
                //failed
                 //Converting nil to URL to pass it as an error state.
                completion(nil! as URL)
            }
        }
    }
    
    func saveProfile(profileImageURL:URL, completion: @escaping ((_ success:Bool)->())) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let databaseRef = Database.database().reference().child("users/profile/\(uid)")
        let userObject = [
            "photoURL": profileImageURL.absoluteString
        ] as [String:Any]
        
        databaseRef.setValue(userObject) { error, ref in
            completion(error == nil)
        }
    }
    
    @objc func openImagePicker(_ sender: Any) {
        self.present(imagePicker, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleLogout(_ sender: UIButton) {
        try! Auth.auth().signOut()
        //self.dismiss(animated: false, completion: nil)
    }
}

extension ProfileViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: false, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.profileImage.image = pickedImage
        }
        
        picker.dismiss(animated: false, completion: nil)
    }
}
