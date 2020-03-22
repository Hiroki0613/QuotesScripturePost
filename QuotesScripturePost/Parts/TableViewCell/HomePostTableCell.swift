//
//  HomePostTableCell.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/14.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit


//Home画面で表示するCell
class HomePostTableCell: UITableViewCell {
    
    //実装確認のプレースホルダー
    var imageArray = ["1","1","1","1","1"]
    var nameArray = ["渋谷","新宿","恵比寿","五反田","高輪ゲートウェイ"]
    var dateArray = ["2020年3月14日7時77分","2020年3月15日7時77分","2020年3月16日7時77分","2020年3月17日7時77分","2020年3月18日7時77分"]
    var postImageArray = ["2","2","2","2","2"]
    var commentArray = ["テスト投稿1","テスト投稿2","テスト投稿3","テスト投稿4","テスト投稿5"]
    

    static let reuseID = "HomePostTableCell"
    let userImage = UIImageView()
    let userNameLabel = UILabel()
    let postDateLabel = UILabel()
    let postImage = UIImageView()
    
    //ここは後日,UiStackViewで実装？
    let heartButton = UIButton()
    let heartNumber = UILabel()
    let commentButton = UIButton()
    let commentNumber = UILabel()
    
//    let shareButton = UIButton()
    let commentLabel = UILabel()
    
    
    
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
        
        postDateLabel.text = dateArray[indexPath.row]
        postImage.image = UIImage(named: postImageArray[indexPath.row])
        
        heartButton.setImage(UIImage(systemName: SFSymbols.heart), for: .normal)
        heartButton.addTarget(self, action: #selector(pushHeartButton), for: .touchUpInside)
        heartButton.tag = indexPath.row
        heartNumber.text = "100"
        
        commentButton.setImage(UIImage(systemName: SFSymbols.comment), for: .normal)
        commentNumber.text = "500"
        
        
//        shareButton.setImage(UIImage(systemName: SFSymbols.share), for: .normal)
        commentLabel.text = commentArray[indexPath.row]
        
    }
    
    @objc func pushHeartButton() {
        print("ハートボタンが押された_\(heartButton.tag)番目の")
    }
    
    
    
    private func configure(){
        addSubview(userImage)
        addSubview(userNameLabel)
        addSubview(postDateLabel)
        addSubview(postImage)
        addSubview(heartButton)
        addSubview(heartNumber)
        addSubview(commentButton)
        addSubview(commentNumber)
//        addSubview(shareButton)
        addSubview(commentLabel)
        
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        postDateLabel.translatesAutoresizingMaskIntoConstraints = false
        postImage.translatesAutoresizingMaskIntoConstraints = false
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        heartNumber.translatesAutoresizingMaskIntoConstraints = false
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        commentNumber.translatesAutoresizingMaskIntoConstraints = false
//        shareButton.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        
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
            userNameLabel.heightAnchor.constraint(equalToConstant: 20),
            userNameLabel.widthAnchor.constraint(equalToConstant: 100),
            
            //Userの投稿日時を定義
            postDateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: padding + 10),
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
            commentNumber.widthAnchor.constraint(equalToConstant: 40),
            
            //シェアボタンを定義(こちらは後日、実装予定)
            

            
            //commentLabelを定義
            commentLabel.topAnchor.constraint(equalTo: heartButton.bottomAnchor, constant: padding),
            commentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            commentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            commentLabel.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }
    
}
