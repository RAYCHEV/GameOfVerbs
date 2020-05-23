//
//  HomeViewController.swift
//  GameOfVerbs1
//
//  Created by Nikolay Raychev on 21.09.18.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = UserDataManager.getUser()
        self.userNameTextField.text = user.nickname
        self.emailTextField.text = user.email
        
    }

    @IBAction func btnStartNewGameTapped(_ sender: UIButton) {
        var userName = self.userNameTextField.text
        var email = self.emailTextField.text
        
        if userName == nil || userName!.isEmpty{
            userName = "Unknown user"
        }
        if email == nil || email!.isEmpty {
            email = "kurcho@gma.ds"
        }
        
        let user: User = User.init(nickname: userName! , email: email!)
        UserDataManager.setUser(user)
        
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let secondViewController = storyBoard.instantiateViewController(withIdentifier: "GameViewControllerSBid") as! GameViewController
            self.present(secondViewController, animated: true, completion: nil)
    }
    
    
}
