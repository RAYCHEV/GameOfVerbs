//
//  SendingAEmail.swift
//  GameOfVerbs1
//
//  Created by Nikolay Raychev on 15.02.19.
//  Copyright © 2019 Nikolay Raychev. All rights reserved.
//

import UIKit
import MessageUI

class SendingAEmail: UIViewController, MFMailComposeViewControllerDelegate {
  
    override func viewDidLoad() {
        composeAEmail()
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    func composeAEmail() {
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            showMailError()
        }
    }
    
    func configureMailController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["quite.smart.stuff@gmail.com"])
        mailComposerVC.setSubject("GameOfVerbs1.007 message from \(UserDataManager.getUser().nickname)(\(UserDataManager.getUser().email))")
        mailComposerVC.setMessageBody("<style>body {color: blue;}</style>", isHTML: true)
        
        return mailComposerVC
    }

    func showMailError()  {
        let sendMailErrorAlert = UIAlertController(title: "Could not send an email", message:  "at the moment your devise can not sent an email" , preferredStyle: .alert)
        sendMailErrorAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func conposeAnEmailButtonAction(_ sender: UIButton) {
        composeAEmail()
    }
}
