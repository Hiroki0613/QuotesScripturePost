//
//  LocalStorageService.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/22.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

class LocalStorageService {
    
    //ユーザー情報の記録
    static func saveCurrentUser(user:PhotoUser) {
        let defaults = UserDefaults.standard
        defaults.set(user.userID, forKey: Constants.LocalStorage.storedUserId)
        defaults.set(user.username, forKey: Constants.LocalStorage.storedUsername)
         }
    
    static func saveUserProfileImageShot(user:PhotoUser) {
        let defaults = UserDefaults.standard
        defaults.set(user.userProfilePhotoStorage, forKey: Constants.LocalStorage.sotredUserPhoto)
    }
    
    
    //現在のユーザー情報を確認、取得
    static func loadCurrentUser() -> PhotoUser? {
        let defaults = UserDefaults.standard
        let userId = defaults.value(forKey: Constants.LocalStorage.storedUserId) as? String
        let username = defaults.value(forKey: Constants.LocalStorage.storedUsername) as? String
        let userProfileImageStorage = defaults.value(forKey: Constants.LocalStorage.sotredUserPhoto) as? String
        //ユーザー情報を取得できない場合はnilをreturn
        guard userId != nil || username != nil || userProfileImageStorage != nil else {
            return nil
        }
        //ユーザー情報をreturn
        let u = PhotoUser(userID: userId!, username: username!, userProfilePhotoStorage: userProfileImageStorage! )
        return u
    }
    
    
    //ユーザー情報の削除
    static func clearCurrentUser() {
        let defaults = UserDefaults.standard
        defaults.set(nil, forKey: Constants.LocalStorage.storedUserId)
        defaults.set(nil, forKey: Constants.LocalStorage.storedUsername)
    }
}
