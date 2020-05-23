//
//  RankingManager.swift
//  GameOfVerbs1
//
//  Created by Nikolay Raychev on 2.11.18.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import Foundation

class RankingManager {
    
    static var rankings: [Ranking] = [Ranking]()
    static var latestAddedRankingId: String = "0"
    
    class func addRanking(ranking: Ranking) {
        RankingRequestManager.addRanking(ranking: ranking)
        self.rankings.append(ranking)
    }
    
    class func addRanking(username: String, points: String) {
        let dateNow = Date.init()
        let id = Int(dateNow.timeIntervalSince1970).description
        latestAddedRankingId = id
        self.rankings.append(Ranking.init(id: id, username: username, points: points))
        RankingRequestManager.addRanking(ranking: Ranking.init(id: id, username: username, points: points))
    }
    
    class func addToReceiveFromFireBase(ranking: Ranking) {
       // self.receiveFromFireBaseRankings.append(ranking)
        self.rankings.append(ranking)
    }
    
    class func getRanking() -> [Ranking] {
        return self.rankings
    }
    
    class func getLatestAddedRankingId() -> String {
        return self.latestAddedRankingId
    }
    
    class func getOrderByScoreRanking() -> [Ranking] {
       
        let sortedRankings = rankings.sorted(by: {
            (ranking1: Ranking, ranking2: Ranking) -> Bool in
            if let ranking1Value = Int(ranking1.points), let ranking2Value = Int(ranking2.points) {
                return ranking1Value > ranking2Value
            }
            return true
        })
        return sortedRankings
    }
    
    
    class func getOrderByDateTimeRanking() -> [Ranking] {
        
        let sortedRankings = rankings.sorted(by: {
            (ranking1: Ranking, ranking2: Ranking) -> Bool in
            if let ranking1Value = Int(ranking1.id), let ranking2Value = Int(ranking2.id) {
                return ranking1Value > ranking2Value
            }
            return true
        })
        return sortedRankings
    }
}
