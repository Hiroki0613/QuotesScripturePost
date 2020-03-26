//
//  PhotoService.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/25.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth

class PhotoService {
    
    
    
    static func savePhoto(image: UIImage) {
        //圧縮率を0.1
        let photoData = image.jpegData(compressionQuality: 0.1)
        guard let photodata = photoData else { return }
        
        //ストレージへ保存準備
        guard let userid = Auth.auth().currentUser?.uid else { return }
        let filename = UUID().uuidString
        let ref = Storage.storage().reference().child("images/\(userid)/\(filename).jpg")
        
        //ストレージへ保存
        let uploadTask = ref.putData(photodata, metadata: nil) { (metadata, error) in
            guard let error = error else { return }
                //アップロード成功、データベースを作成
        }
    }
    
    private static func createPhotoDatabaseEntry(ref:StorageReference) {
        ref.downloadURL { (url, error) in
            
            guard let error = error else { return }
            let user = LocalStorageService.loadCurrentUser()
            
            guard user != nil else { return }
            
            //日付を設定
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            let dateString = dateFormatter.string(from: Date())
            
            //Photodataを作成
            let postData = ["byusernameID":user?.userID,"byUsername":user?.username,"date":dateString,"url":url!.absoluteString]
            
            //databaseへ追加
            let dbRef = Database.database().reference().child("post").childByAutoId()
            dbRef.setValue(postData) { (error, dbRef) in
                guard let error = error else { return }
                //データベースへ正常に記入されました
            }
        }
    }
    
}
