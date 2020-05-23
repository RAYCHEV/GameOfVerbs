//
//  GameDataEngine.swift
//  GameOfVerbs1
//
//  Created by Nikolay Raychev on 30.06.18.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import UIKit
import CSVImporter

enum verbType: Hashable {
    case verb1
    case verb2
    case verb3
}

//Loads and provides verbs data
class GameDataEngine {
    private static var sequenceLength: Int = 2 + AdsRewardsManager.getAdRewardsNum()
    private static var linesOfVerbs: [[String]]?
    
    static var verbsPath: [Verb] = [Verb]()
    static var gameVerbsPath: [Verb] = [Verb]()
    static var isGameMode = true
    
    class func loadVerbs() {
        importFromAFile()
        loadAllVerb()
        //verbsPath = Array(setOfVerbs)
    }
    
    static var currIntInPath: Int = 0
    class func getCurrVerb(giveNext: Bool = false) -> Verb? {
        print(gameVerbsPath)
        var result: Verb?
        //FIXME: the function called more than 1 time
        guard gameVerbsPath.count > 1 else {
            return nil
        }
        if currIntInPath < gameVerbsPath.count {
            result = gameVerbsPath[currIntInPath]
        } else {
          return nil
        }

        if giveNext {
            currIntInPath += 1
        }
        return result
    }
    
    //Synchronously
    class func importFromAFile() {
        let path = Bundle.main.path(forResource: "verbs", ofType: "csv")
        let importer = CSVImporter<[String]>(path: path!)
        let result = importer.importRecords{ $0 } //or
        self.linesOfVerbs = result
    }
    
    class func loadAllVerb() {
//        let indexLineForDiffLevel: Int

        //FIXME: 3 times loop  var num = 0
        //FIXME: must trow an exeption
        for line in self.linesOfVerbs ?? [["n/a","n/a","n/a"]] {
            
            switch SetingsDataManager.gameLevelIrrVerbs {
            case .advanced:
                    self.verbsPath.append(Verb(verb1: line[0], verb2: line[1], verb3: line[2]))
                   // num += 1
                    //print("advanced " + num.description)

            case .intermidiate:
                if line[3] == "2" || line[3] == "3"  {
                    self.verbsPath.append(Verb(verb1: line[0], verb2: line[1], verb3: line[2]))
                   // num += 1
                    //print("intermidiate " + num.description)
                }
            case .beginer:
                if line[3] == "3"  {
                    self.verbsPath.append(Verb(verb1: line[0], verb2: line[1], verb3: line[2]))
                    // num += 1
                    //print("beginer " + num.description)
                }
            }
        }
    }
    //ajust verbPath
    class func loadVerbGamePath() {
        if self.sequenceLength > 16 {
            self.sequenceLength = 16
        }
        
        for _ in 1 ... self.sequenceLength {
            let randomNum: Int = Int(arc4random_uniform(UInt32(verbsPath.count)))
            gameVerbsPath.append(self.verbsPath[randomNum])
            //print(i.description + self.verbsPath[randomNum].verb1)
        }
    }
}
