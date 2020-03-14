//
//  LoginVC.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/14.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    let backgroundView = UIImageView()
    let loginButton = QSButton(view: self, x: 100, y: 100, title: "にほんご")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundView()
        view.addSubview(loginButton)
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


}
