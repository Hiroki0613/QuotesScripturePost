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
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            postButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            postButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height/8),
            postButton.widthAnchor.constraint(equalToConstant: 77),
            postButton.heightAnchor.constraint(equalToConstant: 77)
        ])
    }
}


extension HomeVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomePostTableCell.reuseID, for: indexPath) as! HomePostTableCell
        
        cell.set(indexPath: indexPath)
        
        return cell
    }
}

