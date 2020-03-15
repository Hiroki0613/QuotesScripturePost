//
//  QSToolBar.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/15.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class QSToolBar: UIToolbar {
    
    override init(frame: CGRect) {
         super.init(frame: frame)
        configure()
     }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        barStyle = .black
        barTintColor = .systemGray
        isTranslucent = true
    }
}
