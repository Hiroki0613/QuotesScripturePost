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
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
    }

    
    func configureTableView() {
        view.backgroundColor = .systemBackground
        view.addSubview(homeTableView)
        homeTableView.frame = view.bounds
        homeTableView.rowHeight = 450
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        homeTableView.register(HomePostTableCell.self, forCellReuseIdentifier: HomePostTableCell.reuseID)
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

