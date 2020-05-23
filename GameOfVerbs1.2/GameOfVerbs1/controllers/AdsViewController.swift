//
//  AdsViewController.swift
//  GameOfVerbs1
//
//  Created by Nikolay Raychev on 31.01.19.
//  Copyright © 2019 Nikolay Raychev. All rights reserved.
//
import GoogleMobileAds
import UIKit

class AdsViewController: UIViewController, GADRewardBasedVideoAdDelegate, UIAlertViewDelegate {
    /// The reward-based video ad.
    @IBOutlet weak var currentLevelLabel: UILabel!
    private var currentLevelInt: Int = AdsRewardsManager.getAdRewardsNum()
    private var rewardBasedVideo: GADRewardBasedVideoAd?


    override func viewDidLoad() {
        super.viewDidLoad()
        currentLevelLabel.text = currentLevelInt.description
        rewardBasedVideo = GADRewardBasedVideoAd.sharedInstance()
        rewardBasedVideo?.delegate = self
    }
    
    private func loadVideoAd(){
//        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(), withAdUnitID: "ca-app-pub-3940256099942544/1712485313")
        //my google id
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(), withAdUnitID: "ca-app-pub-6795556779089095/6874509667")
    }
    
    private func increaseAndShowLevel () {
        currentLevelInt += 1
        currentLevelLabel.text = currentLevelInt.description
        AdsRewardsManager.addReward()
    }
    
    
    
    // DELEGATES
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didRewardUserWith reward: GADAdReward) {
        print("Reward received with currency: \(reward.type), amount \(reward.amount).")
        increaseAndShowLevel()
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd:GADRewardBasedVideoAd) {
        print("Reward based video ad is received.")
        GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)    }
    
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Opened reward based video ad.")
    }
    
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad started playing.")
    }
    
    func rewardBasedVideoAdDidCompletePlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad has completed.")
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad is closed.")
    }
    
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad will leave application.")
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didFailToLoadWithError error: Error) {
        let alertController = UIAlertController(title: "Rewarding video program info", message: "Rewarding video is not available at the moment, please check your internet connection and try it later", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
        print("Reward based video ad failed to load.")
    }
    @IBAction func loadRewaredVideoAdButtonAction(_ sender: UIButton) {
        loadVideoAd()
    }
    
    @IBAction func infoButtonAction(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Rewarding video program info", message: "Increasing of you rewards means receiving an extra features for the current and future versions of this software such as a longer sequence patch or an improved learning algorithm.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
}
