//
//  PostQuotesVC.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/19.
//  Copyright © 2020 Hiroki. All rights reserved.
//


//ここで選んだ名言を任意の位置に貼り付けて、問題がなければFireBaseへPostする。

/*
 RotationGesture
 https://www.youtube.com/watch?v=FXwuW7nYlFY
 PinchGesture
 https://www.youtube.com/watch?v=w1l4SWk5kCE
 PanGesture
 https://www.youtube.com/watch?v=beWokMbXoZo
 を使用する。
 
 ただし、まず最初はUILabelを貼り付けるだけに留めておく
*/

//そのあとに、dismissをして、投稿画面に戻る

import UIKit

class PostQuotesVC: UIViewController {
    
    let toolbar = QSToolBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        configureToolbar()

    }
    
    func configureToolbar() {
        self.view.addSubview(toolbar)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        
        //戻るボタンの実装
        let backButton = UIButton(frame: CGRect(x: 0, y:0, width: 100, height: 100))
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        let backButtonItem = UIBarButtonItem(customView: backButton)
        
        //ボタンを左右に分けるためのスペースの実装
        let flexibleItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        
        //進むボタンの実装
        let nextButton = UIButton(frame: CGRect(x: 0, y:0, width: 100, height: 100))
        nextButton.setTitle("Home", for: .normal)
        nextButton.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
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
           self.presentingViewController?.dismiss(animated: true, completion: nil)
       }
       
       // 進むボタンをクリックした時の処理
       @objc func goToHome() {
           
        //firebaseにカードを投稿して、Home画面に戻る
   
        //Dissmissは、ホーム画面に戻るまで行っている。
self.presentingViewController?.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        
       }

    


}
