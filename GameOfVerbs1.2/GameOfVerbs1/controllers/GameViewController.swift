//
//  ViewController.swift
//  GameOfVerbs1
//
//  Created by Nikolay Raychev on 30.06.18.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import UIKit
import SVProgressHUD

class GameViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var verb1TextField: UITextField!
    @IBOutlet weak var verb2TextField: UITextField!
    @IBOutlet weak var verb3TextField: UITextField!
    @IBOutlet weak var verb1Label: UILabel!
    @IBOutlet weak var verb2Label: UILabel!
    @IBOutlet weak var verb3Label: UILabel!
    @IBOutlet weak var verbScoreLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    private var currScore = 0
    private var randVerb: Verb?
    private var tempVerb:(verb1:String, verb2:String, verb3:String) = ("", "", "")
    private var numbOfTry:(verb1: Int, isV1Success: Bool , verb2: Int, isV2Success: Bool, verb3: Int, isV3Success: Bool ) = (0, false, 0, false, 0, false)
    private var gameSetings: DifficultyLevelIrrVerbs = SetingsDataManager.gameLevelIrrVerbs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userNameLabel.text = UserDataManager.getUser().nickname

        verb1TextField.delegate = self
        verb2TextField.delegate = self
        verb3TextField.delegate = self
        GameDataEngine.loadVerbGamePath()
        initGame()
    }
    
    //Load setings
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initGame() {
        randVerb = GameDataEngine.getCurrVerb()
        verbScoreLabel.text = "0"
        loadVerb()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        chekTheVerb(textField: textField)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        chekTheVerb(textField: textField)
    }
    
    private func chekTheVerb(textField: UITextField){
        
        guard textField.text != nil  else {
            return
        }
        guard !textField.text!.isEmpty else {
            return
        }
        
        switch textField {
        case verb2TextField:
            guard tempVerb.verb2 != verb2TextField.text else {
                break
            }
            tempVerb.verb2 = verb2TextField.text ?? ""

            if randVerb?.verb2 == verb2TextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) {
                verb2TextField.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
                showMark(isSuccses: true)
                self.verb2Label.text = ""
                verb2TextField.isEnabled = false
                verb3TextField.becomeFirstResponder()
                numbOfTry.isV2Success = true
                showScore(add: 2 - numbOfTry.verb2)
            } else {
                switch numbOfTry.verb2 {
                case 0:
                    showMark(isSuccses: false)
                case 1:
                    self.nextButton.isHidden = false
                    fallthrough
                default:
                    verb2Label.text = randVerb?.verb2.mixLetters(firstStr: "[", bettwenStr: "][", endStr: "]")
                }
                verb2TextField.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.8)
                showMark(isSuccses: false)
                numbOfTry.verb2 += 1
            }
        case verb3TextField:
            guard tempVerb.verb3 != verb3TextField.text else {
                break
            }
            tempVerb.verb3 = verb3TextField.text ?? ""
            
            if randVerb?.verb3 == verb3TextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) {
                verb3TextField.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
                showMark(isSuccses: true)
                self.verb3Label.text = ""
                verb3TextField.isEnabled = false
                numbOfTry.isV3Success = true
                showScore(add: 2 - numbOfTry.verb3)
            } else {
                switch numbOfTry.verb3 {
                case 0:
                    showMark(isSuccses: false)
                case 1:
                    self.nextButton.isHidden = false
                    fallthrough
                default:
                    verb3Label.text = randVerb?.verb3.mixLetters(firstStr: "[", bettwenStr: "][", endStr: "]")
                    
                }
                verb3TextField.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.8)
                showMark(isSuccses: false)
                numbOfTry.verb3 += 1
            }
        default:
            break
        }
        
    }
    
    private func loadVerb(){
        self.nextButton.isHidden = true
        // if curr verb = nil -> go to another wiew
        guard let rv = GameDataEngine.getCurrVerb(giveNext: true) else {
            // end of game
            // go to the another view
            //alert controller
            showEndOfGame()
        
            return
        }
        self.randVerb = rv
        numbOfTry = (0, false, 0, false, 0, false)
        verb1TextField.text = randVerb!.verb1
        verb1TextField.isEnabled = false
        verb2TextField.isEnabled = true
        verb2TextField.becomeFirstResponder()
        verb3TextField.isEnabled = true
        verb2TextField.text = ""
        verb2TextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        verb3TextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        verb3TextField.text = ""
        verb1Label.text = ""
        verb2Label.text = ""
        verb3Label.text = ""
    }
    
    private func addPoints(thisNumOfTry: Int){
        currScore += 2 - thisNumOfTry
        verbScoreLabel.text = currScore.description

        if numbOfTry.isV2Success && numbOfTry.isV3Success || numbOfTry.verb2 > 2 && numbOfTry.verb3 > 2 {
            self.nextButton.isHidden = false
        }
    }
    
    private func showScore(add points: Int = 0){
        
        currScore += points
        verbScoreLabel.text = currScore.description
        
        if numbOfTry.isV2Success && numbOfTry.isV3Success || numbOfTry.verb2 > 2 && numbOfTry.verb3 > 2 {
            self.nextButton.isHidden = false
        }
    }
    
    @IBAction func nextVerbButtonTapped(_ sender: UIButton) {
//        if !numbOfTry.isV1Success {
//            currScore -= 2
//        }
        
        if !numbOfTry.isV2Success {
            showScore(add: -2)
        }
        
        if !numbOfTry.isV3Success {
            showScore(add: -2)
        }
            loadVerb()
    }
    
    private func showRankList() {
        
    }
    @IBAction func stopBarBtnTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    private func showMark(isSuccses : Bool){
        if isSuccses {
            SVProgressHUD.setForegroundColor(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))           //Ring and text Color
            SVProgressHUD.show(UIImage(named: "chek-mark")!, status: "Well done!")
            SVProgressHUD.dismiss(withDelay: TimeInterval(0.7))

        } else {
            SVProgressHUD.setForegroundColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.8))
            SVProgressHUD.show(UIImage(named: "x-mark")!, status: "Try again")
            SVProgressHUD.dismiss(withDelay: TimeInterval(0.4))

        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "storyboardSequeGameToRanking" {
            let tabBarView = segue.destination as! UITabBarController
            tabBarView.selectedIndex = 1
        }
    }
    
    private func showEndOfGame(){
        
        let alertController = UIAlertController(title: "Level \(SetingsDataManager.gameLevelIrrVerbs.rawValue) game has finished", message: "with score \(currScore.description)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "show rankings", style: .default, handler: { action in
            RankingManager.addRanking(username: self.userNameLabel.text!, points: self.currScore.description)
            self.performSegue(withIdentifier: "storyboardSequeGameToRanking", sender: self)
            //print("Action button has been pressed")
            
        }))
        self.present(alertController, animated: true)
        //alert controller
        //another view
    }

}

