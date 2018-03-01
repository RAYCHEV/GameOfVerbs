//
//  Exersice.swift
//  GameOfVerbsCL
//
//  Created by Nikolay Raychev on 26/02/2018.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import Foundation

class Exersice {
    
    
    
    private let verbs: Verbs
    private let minNumOfArrVerbsCount: Int
    private let msgWellDone = "\t✔︎ Well done!! 😃"
    private let msgWrong = "\t✗  Wrong answer or wrong question  🧐"
    
    init() {
        self.verbs = Verbs()
        self.minNumOfArrVerbsCount = verbs.getMinNumOfArrCount()
    }
    func trimAndClean(_ str: String) -> String {
        let str = str.lowercased()
        return String(str.filter { !" \t".contains($0) })
    }
    
    func exersicing(exerciceVersion: ExersiceName) -> Bool{
        let randomIndex = Int(arc4random_uniform(UInt32(minNumOfArrVerbsCount)))
        //print(randomIndex)
        
        switch exerciceVersion {
        case .byGivenVerb1:
            //print("exersice by given verb 1")
            print("(Infinitive) " + verbs.getVerbsOne(index: randomIndex))
            
            print("Simple Past: ", terminator:"")
            if let simplePast = readLine(){
                if simplePast == "q" {return false}
                if trimAndClean(simplePast) == verbs.getVerbsTwo(index: randomIndex){
                    print(msgWellDone)
                }else{
                    print(msgWrong)
                    
                }
            }
            print("Past Participle: ", terminator:"")
            if let pastParticiple = readLine(){
                if pastParticiple == "q" { return false}
                if trimAndClean(pastParticiple) == verbs.getVerbsThree(index: randomIndex){
                    print(msgWellDone)
                } else {
                    print(msgWrong)
                }
            }
            print("------------\n")
            return true
        default:
            print("those options is not ready yet")
            return false
        }
    }
}
