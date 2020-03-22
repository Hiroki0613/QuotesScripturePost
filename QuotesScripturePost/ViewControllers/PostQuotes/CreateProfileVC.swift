//
//  CreateProfileVC.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/22.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit
import FirebaseAuth

class CreateProfileVC: UIViewController {
    
    let createUserLabel = QSLabel(textAlignment: .center, string: "Welcome \n Please set a username")
    let createUserTextField = QSTextField()
    let createUserButton = QSButton(title: "Create!")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    func configure() {
        view.backgroundColor = .systemBackground
        view.addSubview(createUserLabel)
        view.addSubview(createUserTextField)
        view.addSubview(createUserButton)
        
        //改行をして全文を表示
        createUserLabel.numberOfLines = 0
        
        createUserButton.addTarget(self, action: #selector(createUser), for: .touchUpInside)
        
        createUserLabel.translatesAutoresizingMaskIntoConstraints = false
        createUserTextField.translatesAutoresizingMaskIntoConstraints = false
        createUserButton.translatesAutoresizingMaskIntoConstraints = false
        
        let padding:CGFloat = 40
        
        NSLayoutConstraint.activate([
            createUserLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.frame.height/10),
            createUserLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            createUserLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            createUserLabel.heightAnchor.constraint(equalToConstant: 50),
            
            createUserTextField.topAnchor.constraint(equalTo: createUserLabel.bottomAnchor, constant: padding),
            createUserTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            createUserTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            createUserTextField.heightAnchor.constraint(equalToConstant: 50),
            
            createUserButton.topAnchor.constraint(equalTo: createUserTextField.bottomAnchor, constant: padding),
            createUserButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            createUserButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            createUserButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func createUser() {
        //uidを取得するため、現在のユーザーがログインしているかを確認
        guard let authCurrentUser = Auth.auth().currentUser else {
            print("ユーザーはログインしていません")
            return
        }
        // ユーザー名が適切かを確認する。
        let username = createUserTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        guard username != nil && username != "" else {
            print("ユーザー名が入力されていません")
            return
        }
        //ユーザープロフィールを作成する
        UserService.createUserProfile(userId: authCurrentUser.uid, username: username!) { (u) in
            //すでにユーザーが作成されているのかを確認する
            if u == nil {
                print("プロフィール作成でエラーが発生しました")
            } else {
                //ユーザー情報を保存
                LocalStorageService.saveCurrentUser(user: u!)

                //モーダルで投稿画面に遷移、遷移先は全画面に変更
                let selectPostImageVC = SelectPostImageVC()
                selectPostImageVC.modalPresentationStyle = .fullScreen
                self.present(selectPostImageVC, animated: true, completion: nil)
            }
        }
    }
}
