//
//  AdsRewardsManager.swift
//  GameOfVerbs1
//
//  Created by Nikolay Raychev on 14.02.19.
//  Copyright © 2019 Nikolay Raychev. All rights reserved.
//

import Foundation

class AdsRewardsManager {
    private static var adRewardsNum: Int = getRewardsFromUserDefaults()
    
    private static func getRewardsFromUserDefaults() -> Int {
        return UserDefaults.standard.integer(forKey: "adRewardsNum")
    }
    
    static func addReward(){
        UserDefaults.standard.set(adRewardsNum + 1 , forKey: "adRewardsNum")
    }
    
    static func getAdRewardsNum() -> Int {
        return self.adRewardsNum
    }
}
