//
//  BellViewController.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/14.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class BellVC: UIViewController {
    
    let bellTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
    }
    
    func configureTableView() {
        view.backgroundColor = .systemBackground
        view.addSubview(bellTableView)
        bellTableView.frame = view.bounds
        bellTableView.rowHeight = 60
        bellTableView.delegate = self
        bellTableView.dataSource = self
        
        bellTableView.register(BellTableCell.self, forCellReuseIdentifier: BellTableCell.reuseID)
    }
    
}


extension BellVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = bellTableView.dequeueReusableCell(withIdentifier: BellTableCell.reuseID, for: indexPath) as! BellTableCell
        
        cell.set(indexPath: indexPath)

        return cell
    }
    
    
}
