//
//  EditViewController.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/14.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class EditVC: UIViewController {
    
    //Userdefaultでユーザ名
    //firebaseでプロフィール画像を登録
    //この２つを紐付けて、投稿アプリを作成していく。
    
    
    let userImageView = UIImageView()
    let changeProfileButton = QSButton(title: "プロフィール画像の変更")
    let changeUserNameButton = QSButton(title: "ユーザー名の変更")
    let contactButton = QSButton(title: "お問い合わせ")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUserImageView()
        configureButton()
    }
    
    
    func configureUserImageView() {
        view.addSubview(userImageView)
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.image = UIImage(named: "1")
        
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            userImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userImageView.heightAnchor.constraint(equalToConstant: 200),
            userImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureButton() {
        view.addSubview(changeProfileButton)
        view.addSubview(changeUserNameButton)
        view.addSubview(contactButton)
        
        changeProfileButton.translatesAutoresizingMaskIntoConstraints = false
        changeUserNameButton.translatesAutoresizingMaskIntoConstraints = false
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        
        let padding:CGFloat = 20
        
        NSLayoutConstraint.activate([
            changeProfileButton.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 90),
            changeProfileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            changeProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            changeProfileButton.heightAnchor.constraint(equalToConstant: 40),
            
            changeUserNameButton.topAnchor.constraint(equalTo: changeProfileButton.bottomAnchor, constant: padding*2),
            changeUserNameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            changeUserNameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            changeUserNameButton.heightAnchor.constraint(equalToConstant: 40),
            
            contactButton.topAnchor.constraint(equalTo: changeUserNameButton.bottomAnchor, constant: padding*2),
            contactButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            contactButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            contactButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
