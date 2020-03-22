//
//  PostData.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/22.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation
import FirebaseDatabase

//画像の投稿データ一覧
struct Photo {
    //投稿ID
    var postId:String?
    //プロフィール画像
    var byPrfilePhotoUrl:String?
    //ユーザーID
    var byusernameID:String?
    //ユーザー名
    var byUsername:String?
    //投稿日付
    var date:String?
    //投稿画像
    var byPostUrl:String?
    //ハートの数
    var heartCount:Int?
    //コメントの数
    var commentCount:Int?
    //投稿コメント
    var postComment:String?
    
    //PostDataの初期設定
    init?(snapshot: DataSnapshot) {
        
        let postData = snapshot.value as? [String:String]
        
        if let postData = postData {
            let postId = snapshot.key
            let byPrfilePhotoUrl = postData["byPrfilePhotoUrl"]
            let byusernameID = postData["byusernameID"]
            let byUsername = postData["byUsername"]
            let date = postData["date"]
            let byPostUrl = postData["byPostUrl"]
            let postComment = postData["postComment"]
            
            guard byPrfilePhotoUrl != nil && byusernameID != nil && byUsername != nil && date != nil && byPostUrl != nil && postComment != nil else { return nil }
            
            self.postId = postId
            self.byPrfilePhotoUrl = byPrfilePhotoUrl
            self.byusernameID = byusernameID
            self.byUsername = byUsername
            self.date = date
            self.byPostUrl = byPostUrl
            self.postComment = postComment
        }
    }
}

