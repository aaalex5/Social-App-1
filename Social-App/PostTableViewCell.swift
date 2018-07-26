//
//  PostTableViewCell.swift
//  Social-App
//
//  Created by Alex Alajbegovic on 7/21/18.
//  Copyright © 2018 Alex Alajbegovic. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        //Creates a circular image view
        //I put this line in because sometimes the values equal nil for some reason
        //Probably should check why...
        if (profileImageView != nil) {
            //I added this print to see what the height was (should be 40 rn)
            print(profileImageView.bounds.height)
            profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
            profileImageView.clipsToBounds = true
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPost(post:Post) {
        usernameLabel.text = post.author
        postTextLabel.text = post.text
        
    }
    
}
