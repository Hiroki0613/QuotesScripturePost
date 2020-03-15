//
//  testVC.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/15.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class testVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        configureToolBar()
    }
    
    
    func configureToolBar() {
        
        // ツールバーの高さ
        let footerBarHeight: CGFloat = 100
        
        // ツールバーのインスタンス化
        let toolbar = UIToolbar(frame: CGRect(
            x: 0,
            y: self.view.bounds.size.height - footerBarHeight,
            width: self.view.bounds.size.width,
            height: footerBarHeight)
        )
        
        toolbar.barStyle = .black
        
        //ツールバーで使うボタンの定義
        let backButton = UIButton(frame: CGRect(x: 0, y:0, width: 100, height: 40))
        backButton.setTitle("Back", for: .normal)
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
    }
    
    // 戻るボタンをクリックした時の処理
    @objc func back() {
        print("戻るボタンがクリックされた")
    }
     
    // 進むボタンをクリックした時の処理
    @objc func goToNext() {
        print("進むボタンがクリックされた")
    }
    

}
