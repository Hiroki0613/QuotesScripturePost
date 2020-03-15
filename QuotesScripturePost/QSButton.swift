//
//  QSButton.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/14.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class QSButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    init(view:UIView, x:CGFloat, y:CGFloat, title: String){
//        super.init(frame: .zero)
//        self.backgroundColor = .systemBlue
//        self.setTitle(title, for: .normal)
//        frame = CGRect(x: x, y: y, width: view.frame.size.width * 8 / 10 , height: view.frame.height / 10)
//    }
    
    init(title:String) {
        super.init(frame: .zero)
        self.backgroundColor = .systemBlue
        self.setTitle(title, for: .normal)
        configure()
    }
    
    
    //QSButtonを作成するためのプロパティを定義
    private func configure(){
        layer.cornerRadius      = 20
        setTitleColor(.white, for: .normal)
        titleLabel?.font        = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
