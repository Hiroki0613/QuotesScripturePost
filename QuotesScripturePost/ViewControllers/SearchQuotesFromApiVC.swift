//
//  SearchQuotesFromApiVC.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/16.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class SearchQuotesFromApiVC: UIViewController {
    
    let postImage = UIImageView()
    let searchQuoteLabel = QSLabel(textAlignment: .center, string: "Search Quotes")
    let quoteTextField = QSTextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configurePostImage()
        configureLabel()
        configureTextField()
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
    
    func configureLabel() {
        self.view.addSubview(searchQuoteLabel)
        searchQuoteLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let padding:CGFloat = 20
        
        NSLayoutConstraint.activate([
            searchQuoteLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: padding),
            searchQuoteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            searchQuoteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            searchQuoteLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
    func configureTextField() {
        self.view.addSubview(quoteTextField)
        quoteTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let padding:CGFloat = 20
        
        NSLayoutConstraint.activate([
            quoteTextField.topAnchor.constraint(equalTo: searchQuoteLabel.bottomAnchor, constant: padding),
            quoteTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            quoteTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            quoteTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }


}
