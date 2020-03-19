//
//  SearchQuotesCell.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/19.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class SearchQuotesCell: UITableViewCell {
    //暫定で入力されるArray
    var authorArray = ["渋谷","新宿","恵比寿","五反田","高輪ゲートウェイ"]
    var quotesArray = ["テスト投稿1","テスト投稿2","テスト投稿3","テスト投稿4","テスト投稿5"]
    
    
    static let reuseID = "SearchQuotesTableCell"
    let authorName = UILabel()
    let quotesLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //Cellへlabelをセットする
    func set(indexPath: IndexPath){
        authorName.text = authorArray[indexPath.row]
        quotesLabel.text = quotesArray[indexPath.row]
    }
    
    
    private func configure() {
        addSubview(authorName)
        addSubview(quotesLabel)
        
        authorName.translatesAutoresizingMaskIntoConstraints = false
        quotesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let padding:CGFloat = 12
        
        NSLayoutConstraint.activate([
            authorName.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            authorName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            authorName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            authorName.heightAnchor.constraint(equalToConstant: 10),
            
            quotesLabel.topAnchor.constraint(equalTo: authorName.bottomAnchor, constant: padding),
            quotesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding * 3),
            quotesLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            quotesLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding)
        ])
    }
}
