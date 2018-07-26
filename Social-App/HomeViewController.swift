//
//  HomeViewController.swift
//  Social-App
//
//  Created by Alex Alajbegovic on 7/24/18.
//  Copyright © 2018 Alex Alajbegovic. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //Coded in table view
    var tableView:UITableView!
    
    //Testing creating some posts
    var posts = [
        Post(id: "1", author: "Samy", text: "I'm a funny boy"),
        Post(id: "2", author: "Alex", text: "I'm more funny than Samy"),
        Post(id: "3", author: "John", text: "Hey boys:O")
    ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView)
        
        //registers the PostTableViewCell.xib we created for any cell
        //identified by "postCell"
        let cellNib = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "postCell")
        
        var layoutguide:UILayoutGuide!
        
        if #available(iOS 11.0, *) {
            layoutguide = view.safeAreaLayoutGuide
        } else {
            //fallback to earlier versions
            layoutguide = view.layoutMarginsGuide
        }
        
        //setting constraints for coded tableview!
        tableView.leadingAnchor.constraint(equalTo: layoutguide.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: layoutguide.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: layoutguide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: layoutguide.bottomAnchor).isActive = true
        
        //Attaches this tableView to this class (the PostTableViewCell)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        //allows for the view to run through each function method and update
        tableView.reloadData()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //I think this tells what cells should appear in the table view not super sure though!
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        cell.setPost(post: posts[indexPath.row])
        return cell
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
