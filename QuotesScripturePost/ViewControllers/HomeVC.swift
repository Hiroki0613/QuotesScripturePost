//
//  ViewController.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/14.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    let homeTableView = UITableView()
    let postButton = PostButton()
    
    //どのセルのコメントボタンが押されたのかを確認する
    var commentButtonIndexPath = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        configureTableView()
        configurePostButton()
    }
    
    
    func configureTableView() {
        view.backgroundColor = .systemBackground
        view.addSubview(homeTableView)
        homeTableView.frame = view.bounds
        homeTableView.rowHeight = 500
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.register(HomePostTableCell.self, forCellReuseIdentifier: HomePostTableCell.reuseID)
    }
    
    
    func configurePostButton() {
        view.addSubview(postButton)
        postButton.addTarget(self, action: #selector(pushLoginVC), for: .touchUpInside)
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            postButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            postButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height/8),
            postButton.widthAnchor.constraint(equalToConstant: 77),
            postButton.heightAnchor.constraint(equalToConstant: 77)
        ])
    }
    
    
    @objc func pushLoginVC() {
        //モーダルでの画面遷移、遷移先は全画面に変更
        //暫定的にcommunicationVCへ画面遷移を変更、UI確認後にLoginVCへ戻すこと
        let loginVC = CommunicationVC()
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)
    }
}


extension HomeVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomePostTableCell.reuseID, for: indexPath) as! HomePostTableCell
        cell.set(indexPath: indexPath)
        cell.commentButton.tag = indexPath.row
        commentButtonIndexPath = cell.commentButton.tag
        cell.commentButton.addTarget(self, action: #selector(pushCommentButton), for: .touchUpInside)
        return cell
    }
    
    
    
    @objc func pushCommentButton () {
        //モーダルでの画面遷移、遷移先は全画面に変更
        print("コメントボタンが押された_\(commentButtonIndexPath)番目の")
        let communicationVC = CommunicationVC()
        communicationVC.modalPresentationStyle = .fullScreen
        self.present(communicationVC, animated: true, completion: nil)
    }
}

