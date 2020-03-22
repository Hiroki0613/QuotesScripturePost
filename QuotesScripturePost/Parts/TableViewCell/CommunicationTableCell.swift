//
//  CommunicationTableCell.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/21.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

//Communication画面で表示するCell
class CommunicationTableCell: UITableViewCell {
    
    //実装確認のプレースホルダー
    var imageArray = ["1","1","1","1","1"]
    var nameArray = ["渋谷","新宿","恵比寿","五反田","高輪ゲートウェイ"]
    var dateArray = ["2020年3月14日7時77分","2020年3月15日7時77分","2020年3月16日7時77分","2020年3月17日7時77分","2020年3月18日7時77分"]
    var commentArray = ["テスト投稿1","テスト投稿2","テスト投稿3","テスト投稿4","テスト投稿5"]
    
    
    static let reuseID = "CommunicationTableCell"
    let userImage = UIImageView()
    let userNameLabel = UILabel()
    let commentLabel = UILabel()
    let postDateLabel = UILabel()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //Cellへ名前、画像などをセットする
    func set(indexPath: IndexPath){
        userImage.image = UIImage(named: imageArray[indexPath.row])
        userNameLabel.text = nameArray[indexPath.row]
        commentLabel.text = commentArray[indexPath.row]
        postDateLabel.text = dateArray[indexPath.row]
    }
    
    
    private func configure(){
        addSubview(userImage)
        addSubview(userNameLabel)
        addSubview(commentLabel)
        addSubview(postDateLabel)
        
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        postDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        userNameLabel.textAlignment = .left
        postDateLabel.textAlignment = .right
        
        let padding:CGFloat = 10
        
        NSLayoutConstraint.activate([
            //Userのイメージ画像のcell定義
            userImage.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            userImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            userImage.heightAnchor.constraint(equalToConstant: 40),
            userImage.widthAnchor.constraint(equalToConstant: 40),

            //Userの名前のcell定義
            userNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: padding + 10),
            userNameLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            userNameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            //commentLabelを定義
            commentLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: padding),
            commentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            commentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            commentLabel.heightAnchor.constraint(equalToConstant: 30),

            //Userの投稿日時を定義
            postDateLabel.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: padding),
            postDateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            postDateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            postDateLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
