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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configurePostImage()
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


}
