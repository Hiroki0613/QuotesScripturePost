//
//  CreateProfileVC.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/22.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class CreateProfileVC: UIViewController {
    
    let createUserLabel = QSLabel(textAlignment: .center, string: "Welcome \n Please set a username")
    let createUserTextField = QSTextField()
    let createUserButton = QSButton(title: "Create!")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    func configure() {
        view.backgroundColor = .systemBackground
        view.addSubview(createUserLabel)
        view.addSubview(createUserTextField)
        view.addSubview(createUserButton)
        
        //改行をして全文を表示
        createUserLabel.numberOfLines = 0
        
        createUserButton.addTarget(self, action: #selector(createUser), for: .touchUpInside)
        
        createUserLabel.translatesAutoresizingMaskIntoConstraints = false
        createUserTextField.translatesAutoresizingMaskIntoConstraints = false
        createUserButton.translatesAutoresizingMaskIntoConstraints = false
        
        let padding:CGFloat = 40
        
        NSLayoutConstraint.activate([
            createUserLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.frame.height/10),
            createUserLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            createUserLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            createUserLabel.heightAnchor.constraint(equalToConstant: 50),
            
            createUserTextField.topAnchor.constraint(equalTo: createUserLabel.bottomAnchor, constant: padding),
            createUserTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            createUserTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            createUserTextField.heightAnchor.constraint(equalToConstant: 50),
            
            createUserButton.topAnchor.constraint(equalTo: createUserTextField.bottomAnchor, constant: padding),
            createUserButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            createUserButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            createUserButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func createUser() {
        print("createUserボタンが押された")
    }
}
