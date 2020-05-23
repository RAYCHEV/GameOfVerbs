//
//  SettingsViewController.swift
//  GameOfVerbs1
//
//  Created by Nikolay Raychev on 9.09.18.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    var gameLevelIrrVerb: DifficultyLevelIrrVerbs = SetingsDataManager.gameLevelIrrVerbs
    
    //Fixme: segmenControl.default state //will be useful when the settings will be loaded from USERDefouts
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //print("viewWillDisappear setings ")
        SetingsDataManager.gameLevelIrrVerbs = self.gameLevelIrrVerb
    }
    
    private func initGameDiffLevelSegmentCtrl(){
        
    }
    
    @IBAction func gameLevelIrrVerbSegmentedControll(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            gameLevelIrrVerb = .beginer
        case 1:
            gameLevelIrrVerb = .intermidiate
        case 2:
            gameLevelIrrVerb = .advanced
        default:
            break
        }
    }
}
