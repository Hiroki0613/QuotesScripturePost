//
//  SelectPostImageVC.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/15.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class SelectPostImageVC: UIViewController {
    
    
    let postImage = UIImageView()
    let toolbar = QSToolBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configurePostImage()
        configureToolbar()
    }
    
    func configurePostImage() {
        self.view.addSubview(postImage)
        postImage.translatesAutoresizingMaskIntoConstraints = false
        
        //暫定で桜の画像を入れている
        postImage.image = UIImage(named: "sakura")
        postImage.contentMode = .scaleToFill
        
        NSLayoutConstraint.activate([
            postImage.topAnchor.constraint(equalTo: view.topAnchor),
            postImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postImage.heightAnchor.constraint(equalToConstant: view.frame.width),
            postImage.heightAnchor.constraint(equalToConstant: view.frame.width)
        ])
    }
    
    
    func configureToolbar() {
        self.view.addSubview(toolbar)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        
        //戻るボタンの実装
        let backButton = UIButton(frame: CGRect(x: 0, y:0, width: 100, height: 100))
        backButton.setTitle("Close", for: .normal)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        let backButtonItem = UIBarButtonItem(customView: backButton)
        
        //ボタンを左右に分けるためのスペースの実装
        let flexibleItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        
        //進むボタンの実装
        let nextButton = UIButton(frame: CGRect(x: 0, y:0, width: 100, height: 100))
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(goToNext), for: .touchUpInside)
        let nextButtonItem = UIBarButtonItem(customView: nextButton)
        
        // ツールバーにアイテムを追加する.
        toolbar.items = [backButtonItem,flexibleItem,nextButtonItem]
        
        self.view.addSubview(toolbar)
        
        NSLayoutConstraint.activate([
            toolbar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            toolbar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            toolbar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            toolbar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
      // 戻るボタンをクリックした時の処理
       @objc func back() {
        //モーダルで投稿画面に遷移、遷移先は全画面に変更
        let homeVC = HomeVC()
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: true, completion: nil)
       }
        
       // 進むボタンをクリックした時の処理
       @objc func goToNext() {
           print("進むボタンがクリックされた")
       }
}




