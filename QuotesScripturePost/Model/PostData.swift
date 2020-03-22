//
//  PostData.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/22.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation
import FirebaseDatabase

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
    
}

