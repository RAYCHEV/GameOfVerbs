//
//  Settings.swift
//  GameOfVerbs1
//
//  Created by Nikolay Raychev on 9.09.18.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import Foundation

enum DifficultyLevelIrrVerbs: Int {
    case beginer = 1
    case intermidiate = 2
    case advanced = 3
}

enum languages {
    case none
    case bulgarian
    case romanian
}

struct Settings {
    var diffLevelIrrVerb: DifficultyLevelIrrVerbs
    
}
