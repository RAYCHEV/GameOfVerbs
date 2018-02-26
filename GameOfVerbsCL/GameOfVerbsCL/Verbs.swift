//
//  Verbs.swift
//  GameOfVerbsCL
//
//  Created by Nikolay Raychev on 26/02/2018.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import Foundation

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
