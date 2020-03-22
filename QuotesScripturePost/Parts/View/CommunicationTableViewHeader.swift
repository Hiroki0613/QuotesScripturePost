//
//  CommunicationTableViewHeader.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/22.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class CommunicationTableViewHeader: UIView {
    
    //実装確認のプレースホルダー
    var passedUserImage = UIImage(named: "1")
    var passedName = "渋谷"
    var passedDate = "2020年3月14日7時77分"
    var passedPostImage = UIImage(named: "2")
    var passedHeartNumber = "100"
    var passedCommentNumber = "500"
    var commentArray = ["テスト投稿1","テスト投稿2","テスト投稿3","テスト投稿4","テスト投稿5"]
    
    let userImage = UIImageView()
    let userNameLabel = UILabel()
    let postDateLabel = UILabel()
    let postImage = UIImageView()
    
    //ここは後日,UiStackViewで実装？
    let heartButton = UIButton()
    let heartNumber = UILabel()
    let commentButton = UIButton()
    let commentNumber = UILabel()
    
    let communicationTableView = UITableView()
    let communicationTextField = QSTextField()
    let postCommentButton = QSButton(title: "投稿")
    let toolbar = QSToolBar()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configurePostView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set() {
        userImage.image = passedUserImage
        userNameLabel.text = passedName
        postDateLabel.text = passedDate
        postImage.image = passedPostImage
        heartButton.setImage(UIImage(systemName: SFSymbols.heart), for: .normal)
        heartNumber.text = passedHeartNumber
        commentButton.setImage(UIImage(systemName: SFSymbols.comment), for: .normal)
        commentNumber.text = passedCommentNumber
    }
    
    
    private func configurePostView(){
        addSubview(userImage)
        addSubview(userNameLabel)
        addSubview(postDateLabel)
        addSubview(postImage)
        addSubview(heartButton)
        addSubview(heartNumber)
        addSubview(commentButton)
        addSubview(commentNumber)
        
        
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        postDateLabel.translatesAutoresizingMaskIntoConstraints = false
        postImage.translatesAutoresizingMaskIntoConstraints = false
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        heartNumber.translatesAutoresizingMaskIntoConstraints = false
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        commentNumber.translatesAutoresizingMaskIntoConstraints = false
        
        userNameLabel.textAlignment = .left
        postDateLabel.textAlignment = .right
        
        let padding:CGFloat = 10
        
        NSLayoutConstraint.activate([
            //Userのイメージ画像のcell定義
            userImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: padding),
            userImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            userImage.heightAnchor.constraint(equalToConstant: 40),
            userImage.widthAnchor.constraint(equalToConstant: 40),
            
            //Userの名前のcell定義
            userNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: padding + 10),
            userNameLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 10),
            userNameLabel.heightAnchor.constraint(equalToConstant: 20),
            userNameLabel.widthAnchor.constraint(equalToConstant: 100),
            
            //Userの投稿日時を定義
            postDateLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: padding + 10),
            postDateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            postDateLabel.heightAnchor.constraint(equalToConstant: 20),
            postDateLabel.widthAnchor.constraint(equalToConstant: 200),
            
            //投稿画像を定義
            postImage.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 10),
            postImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            postImage.heightAnchor.constraint(equalToConstant: self.bounds.width),
            postImage.widthAnchor.constraint(equalToConstant: self.bounds.width),
            
            //ハートボタンを定義
            heartButton.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10),
            heartButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            heartButton.heightAnchor.constraint(equalToConstant: 20),
            heartButton.widthAnchor.constraint(equalToConstant: 20),
            
            //ハートの数を定義
            heartNumber.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10),
            heartNumber.leadingAnchor.constraint(equalTo: heartButton.trailingAnchor, constant: 5),
            heartNumber.heightAnchor.constraint(equalToConstant: 20),
            heartNumber.widthAnchor.constraint(equalToConstant: 40),
            
            //コメントボタンを定義
            commentButton.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10),
            commentButton.leadingAnchor.constraint(equalTo: heartNumber.trailingAnchor, constant: 10),
            commentButton.heightAnchor.constraint(equalToConstant: 20),
            commentButton.widthAnchor.constraint(equalToConstant: 20),
            
            //コメント数を定義
            commentNumber.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10),
            commentNumber.leadingAnchor.constraint(equalTo: commentButton.trailingAnchor, constant: 5),
            commentNumber.heightAnchor.constraint(equalToConstant: 20),
            commentNumber.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}
