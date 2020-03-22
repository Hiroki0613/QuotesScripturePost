//
//  LoginVC.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/14.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit
import FirebaseUI

class LoginVC: UIViewController {
    
    let backgroundView = UIImageView()
    let loginButton = QSButton(title: "LOGIN")
    let backToHomeButton = QSButton(title: "Back to HOME")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundView()
        configureLoginButton()
        configureBackToHomeButton()
    }
    
    
    func configureBackgroundView() {
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundView.contentMode = .scaleAspectFill
        backgroundView.image = UIImage(named: "sakura")
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    func configureLoginButton(){
        view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(loginToPost), for: .touchUpInside)
        
        let padding:CGFloat = 40
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.frame.height/14),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func loginToPost() {
        
        let authUI = FUIAuth.defaultAuthUI()
        
        guard let authui = authUI else { return }
        authui.delegate = self
        //Eメールでのログインを実装
        authui.providers = [FUIEmailAuth()]
        
        //firebaseのauthViewControllerを実装
        let authViewController = authui.authViewController()
        
        //FirebaseUIのログイン画面に遷移
        present(authViewController, animated: true, completion: nil)

    }
    
    
    func configureBackToHomeButton(){
        view.addSubview(backToHomeButton)
        backToHomeButton.addTarget(self, action: #selector(backToHome), for: .touchUpInside)
        
        let padding:CGFloat = 40
        
        NSLayoutConstraint.activate([
            backToHomeButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: view.frame.height/14),
            backToHomeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            backToHomeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            backToHomeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    @objc func backToHome() {
        //Home画面に戻る
        dismiss(animated: true, completion: nil)
    }

}


extension LoginVC: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        
        guard error == nil else {
            print("エラーが発生しました")
            return
        }
        
        //ログイン(すでにログインしている場合は、この動作をパス)を追加予定
        
        
        //認証OK
        //ログイン後に、投稿画面に遷移
        //モーダルで投稿画面に遷移、遷移先は全画面に変更
              let selectPostImageVC = SelectPostImageVC()
              selectPostImageVC.modalPresentationStyle = .fullScreen
              self.present(selectPostImageVC, animated: true, completion: nil)
        
    }
}
