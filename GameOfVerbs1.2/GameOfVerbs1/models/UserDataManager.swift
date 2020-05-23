//
//  UserDataManager.swift
//  GameOfVerbs1
//
//  Created by Nikolay Raychev on 8.10.18.
//  Copyright © 2018 Nikolay Raychev. All rights reserved.
//

import Foundation

class UserDataManager {
    private static var user: User = getUserFromUserDefaults()
    
    private static func getUserFromUserDefaults() -> User {
        let uName = UserDefaults.standard.string(forKey: "userName") ?? "Unknown User"
        let uEmail = UserDefaults.standard.string(forKey: "userEmail") ?? "unknown@mail.com"
        return User.init(nickname: uName, email: uEmail)
    }
    
    // TODO: func setUser()
    
    static func setUser(_ user: User){
        
        self.user = user
        UserDefaults.standard.set(user.nickname, forKey: "userName")
        UserDefaults.standard.set(user.email, forKey: "userEmail")
    }
    
    static func getUser() -> User {
            return self.user
    }
}
