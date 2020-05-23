//
//  mixLetters.swift
//  GameOfVerbs1
//
//  Created by Nikolay Raychev on 3.08.18.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import Foundation

extension String {
    
    func mixLetters() -> String {
        let input = self
        var result = ""
        var target = Array(input)
        
        for _ in 0 ..< input.count {
            let ranNum = Int(arc4random_uniform(UInt32(target.count)))
            result.append(target[ranNum])
            target.remove(at: ranNum)
        }
        return result
    }
    
    
    func mixLetters(firstStr: String = "", bettwenStr: String = "", endStr: String = "") -> String {
        let input = self
        var result = firstStr
        var target = Array(input)
        
        for i in 0 ..< input.count {
            let ranNum = Int(arc4random_uniform(UInt32(target.count)))
            result.append(target[ranNum])
          
            if i < input.count-1 {
                result.append(bettwenStr)
            } else {
                result.append(endStr)
            }
            target.remove(at: ranNum)
        }
        return result
    }
}
