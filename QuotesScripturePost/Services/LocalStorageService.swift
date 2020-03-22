//
//  LocalStorageService.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/22.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

class LocalStorageService {
    
    static func saveCurrentUser(user:PhotoUser) {
        
        let defaults = UserDefaults.standard
        
        defaults.set(user.userID, forKey: "storedUserId")
        defaults.set(user.username, forKey: "storedUsername")
    }
}
