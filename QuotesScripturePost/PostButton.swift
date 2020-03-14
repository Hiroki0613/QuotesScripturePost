//
//  PostButton.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/14.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class PostButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
       
    //PostButtonを作成するためのプロパティを定義
    private func configure(){
        layer.cornerRadius = 40
        backgroundColor = .systemGray
        setImage(UIImage(systemName: SFSymbols.post), for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
       
       
}
