//
//  Post.swift
//  Social-App
//
//  Created by Alex Alajbegovic on 7/26/18.
//  Copyright © 2018 Alex Alajbegovic. All rights reserved.
//

import Foundation


class Post {
    var id:String
    var author:String
    var text:String
    
    init(id:String, author:String, text:String) {
        self.id = id
        self.author = author
        self.text = text
    }
}
