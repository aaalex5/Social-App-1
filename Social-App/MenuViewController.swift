//
//  MenuViewController.swift
//  Social-App
//
//  Created by Alex Alajbegovic on 6/5/18.
//  Copyright © 2018 Alex Alajbegovic. All rights reserved.
//

import UIKit
//Look up what a protocol is
protocol SlideMenuDelegate {
    func slideMenuSelectedAt(_ index : Int32)
}

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var buttonMenuOverlay: UIButton!
    var buttonMenu : UIButton!
    var delegate : SlideMenuDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Allows for the menu to retract when the main screen is touched instead of
    //the button
    @IBAction func buttonCloseTapped(_ sender: UIButton) {
        buttonMenu.tag = 0
        buttonMenu.isHidden = false
        if (self.delegate != nil) {
            var index = Int32(sender.tag)
            if (sender == self.buttonMenuOverlay) {
                index = -1
            }
            delegate?.slideMenuSelectedAt(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width:
                UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        })
    }
    
    @IBAction func menuButtonTapped(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell") as! MenuTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoreboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let DVC = mainStoreboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.navigationController?.pushViewController(DVC, animated: true)
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
