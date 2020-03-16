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
    let takePhotoButton = QSButton(title: "Take Photo")
    let useAlbumButton = QSButton(title: "Use Album")
    let usePixabayButton = QSButton(title: "Use Pixabay Stock")
    let logoutButton = QSButton(title: "LOG OUT")
    let toolbar = QSToolBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configurePostImage()
        configureButton()
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
    
    func configureButton() {
        self.view.addSubview(takePhotoButton)
        self.view.addSubview(useAlbumButton)
        self.view.addSubview(usePixabayButton)
        self.view.addSubview(logoutButton)
        
        takePhotoButton.translatesAutoresizingMaskIntoConstraints = false
        useAlbumButton.translatesAutoresizingMaskIntoConstraints = false
        usePixabayButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        let padding:CGFloat = 30
        
        NSLayoutConstraint.activate([
            takePhotoButton.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: padding),
            takePhotoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            takePhotoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            takePhotoButton.heightAnchor.constraint(equalToConstant: 50),
            
            useAlbumButton.topAnchor.constraint(equalTo: takePhotoButton.bottomAnchor, constant: padding),
            useAlbumButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            useAlbumButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            useAlbumButton.heightAnchor.constraint(equalToConstant: 50),
            
            usePixabayButton.topAnchor.constraint(equalTo: useAlbumButton.bottomAnchor, constant: padding),
            usePixabayButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            usePixabayButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            usePixabayButton.heightAnchor.constraint(equalToConstant: 50),
            
            logoutButton.topAnchor.constraint(equalTo: usePixabayButton.bottomAnchor, constant: padding),
            logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            logoutButton.heightAnchor.constraint(equalToConstant: 50)
            
            
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




