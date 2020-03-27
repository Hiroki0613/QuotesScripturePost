//
//  UserService.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/22.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class UserService {
    
    //ユーザー情報を作成
    static func createUserProfile(userId:String, username:String, completion: @escaping (PhotoUser?) -> Void) {
        
        // ユーザー情報のdictionaryを作成
        let userProfileData = ["username":username]
        //databaseからrefを取得
        let ref = Database.database().reference()
        // UserIDからプロフィールを作成
        ref.child("users").child(userId).setValue(userProfileData) { (error, ref) in
            
            if error != nil {
                //エラーが発生
                completion(nil)
            } else {
                //ユーザー情報を作成して、return
                let u = PhotoUser(userID: userId, username: username)
                completion(u)
            }
        }
    }
    
    
    static func saveUserProfileImage(image: UIImage) {
        //圧縮率を0.1
        let profileData = image.jpegData(compressionQuality: 0.1)
        
        guard let profiledata = profileData else { return }
        
        //ストレージへ保存準備
        let userid = Auth.auth().currentUser!.uid
        let ref = Storage.storage().reference().child("profile/\(userid).jpg")
        
         //ストレージへ保存
        let uploadTask = ref.putData(profiledata, metadata: nil) { (metadata, error) in
            if let error = error {
                //アップロード中にエラー発生
            } else {
            //アップロード成功、データベースを作成
                
            }
        }
    }
    
    
    private static func createProfileDatabaseEntry(ref:StorageReference) {
        ref.downloadURL { (url, error) in
            if let error = error {
                return
            } else {
                let user = LocalStorageService.loadCurrentUser()
                
                guard user != nil else { return }
                
                
            }
        }
    }
    
    
    
    
    
    //ユーザー情報を取得(ログイン時に使用)
    static func getUserProfile(userId:String, completion: @escaping (PhotoUser?) -> Void) {
        
        //databaseからrefを取得
        let ref = Database.database().reference()
        ref.child("users").child(userId).observeSingleEvent(of: .value) { (snapshot) in
            
            //snapshotに入っている、ユーザー情報が入っているかを確認する
            if let userProfileData = snapshot.value as? [String: Any] {
                
                //ユーザー情報が入っていることを確認
                var u = PhotoUser()
                u.userID = snapshot.key
                u.username = userProfileData["username"] as? String
                
                //取得したユーザー情報を入力して、return
                completion(u)
            } else {
                //ユーザー情報は入っていない
                completion(nil)
            }
        }
    }
}
