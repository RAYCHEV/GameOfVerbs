//
//  main.swift
//  GameOfVerbsCL
//
//  Created by Nikolay Raychev on 06/12/2017.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import Foundation

enum VerbsForm {
    case v1All
    case v2All
    case v3All
    case vAll
    case verbAllForms
}

enum SingleVerbForm {
    case form1B
    case form2Pt
    case form3PP
}

class Verbs{
    private let verbsOne = ["go", "do"]
    private let verbsTwo = ["went", "did"]
    private let verbsThree = ["gone", "done"]
    private let minNumOfArrCount: Int
    
    init() {
        //todo - cheking the arrays
        self.minNumOfArrCount = min(verbsOne.count, verbsTwo.count, verbsThree.count)
    }
    func isValidIndex(index: Int, errNo: Any?) -> Bool {
        if index>=0 && index < minNumOfArrCount {
            return true
        } else {
            print("Err \(String(describing: errNo)) > Invalid index")
            return false
        }
    }
    
    func getVerbsOne(index: Int) -> String {
        if isValidIndex(index: index, errNo: 1){
            return self.verbsOne[index]
        } else {
            return ""
        }
    }
    
    func getVerbsTwo(index: Int) -> String {
        if isValidIndex(index: index, errNo: 2){
            return self.verbsTwo[index]
        } else {
            return ""
        }
    }
    
    func getVerbsThree(index: Int) -> String {
        if isValidIndex(index: index, errNo: 3){
            return self.verbsThree[index]
        } else {
            return ""
        }
    }
    
    func getMinNumOfArrCount() -> Int {
        return self.minNumOfArrCount
    }
    
    func showVerbs(_ verbsinit: VerbsForm, _ index:Int? = nil){
        
        switch verbsinit {
        case .v1All:
            print(verbsOne)
        case .v2All:
            print(verbsTwo)
        case .v3All:
            print(verbsThree)
        case .vAll:
            
            for i in 0..<(minNumOfArrCount) {
                print("\t\(verbsOne[i]) \t| \(verbsTwo[i]) \t| \(verbsThree[i])")
            }
        case .verbAllForms:
            if let i = index {
                if i>=0 && i < minNumOfArrCount{
                    print("\t\(verbsOne[i]) \t| \(verbsTwo[i]) \t| \(verbsThree[i])")
                    //                print("ok \(i)")
                }else{
                    print("Err >> invalid index")
                }
            }else{
                print("Err >> the given index is nil")
            }
        }
    }
    
    func chekingAVerb(indexOfTheVerb: Int, checkedVerb: String, formOfVerb: SingleVerbForm ) -> Bool {
        
        if indexOfTheVerb < 0 || indexOfTheVerb >= minNumOfArrCount {
            print("Err > index is out of range")
            return false
        }
        
        
        switch formOfVerb {
        case .form1B:
            print("form basic")
            if  verbsOne[indexOfTheVerb] == checkedVerb{
                return true
            }
            
        case .form2Pt:
            print("form past tense")
            if verbsTwo[indexOfTheVerb] == checkedVerb{
                return true
            }
            
        case .form3PP:
            print("form past participle")
            if verbsThree[indexOfTheVerb] == checkedVerb{
                return true
            }
        }
        return false
    }
}

class Exersice {
    
    enum ExersiceName {
        case byGivenVerb1
        case byGivenVerb2
        case byGivenVerb3
        //todo - case byGiven verb in other language
    }
    
    private let verbs: Verbs
    private let minNumOfArrVerbsCount: Int
    
    init() {
        self.verbs = Verbs()
        self.minNumOfArrVerbsCount = verbs.getMinNumOfArrCount()
    }
    func trimAndClean(_ str: String) -> String {
        let str = str.lowercased()
        return String(str.filter { !" \t".contains($0) })
    }
    
    func exersicing(exerciceVersion: ExersiceName){
        let randomIndex = Int(arc4random_uniform(UInt32(minNumOfArrVerbsCount)))
        //print(randomIndex)
        
        switch exerciceVersion {
        case .byGivenVerb1:
            //print("exersice by given verb 1")
            print("(Infinitive) " + verbs.getVerbsOne(index: randomIndex))
            
            print("Simple Past: ", terminator:"")
            if let simplePast = readLine(){
                if trimAndClean(simplePast) == verbs.getVerbsTwo(index: randomIndex){
                    print("Well done!!")
                }else{
                    print("Wrong answer or wrong question")
                    
                }
            }
            print("Past Participle: ", terminator:"")
            if let pastParticiple = readLine(){
                if trimAndClean(pastParticiple) == verbs.getVerbsThree(index: randomIndex){
                    print("Well done!!!")
                } else {
                    print("Wrong answer or wrong question")
                }
            }
            print("------------\n")
        default:
            print("those options is not ready yet")
        }
    }
}

let ex = Exersice()
while(true){
    ex.exersicing(exerciceVersion: .byGivenVerb1)
}
