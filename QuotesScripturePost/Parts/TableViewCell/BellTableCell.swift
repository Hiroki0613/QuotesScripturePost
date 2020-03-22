//
//  BellTableCell.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/19.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class BellTableCell: UITableViewCell {

    //実装確認のプレースホルダー
    var imageArray = ["1","1","1","1","1"]
    var bellTitleArray = ["テスト投稿1","テスト投稿2","テスト投稿3","テスト投稿4","テスト投稿5"]
    
    
    static let reuseID = "BellTableCell"
    let bellName = UIImageView()
    let bellTitle = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //Cellへlabelをセットする
    func set(indexPath: IndexPath){
        bellName.image = UIImage(named: imageArray[indexPath.row])
        bellTitle.text = bellTitleArray[indexPath.row]
    }
    
    
    private func configure() {
        addSubview(bellName)
        addSubview(bellTitle)
        
        bellName.translatesAutoresizingMaskIntoConstraints = false
        bellTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let padding:CGFloat = 12
        
        NSLayoutConstraint.activate([
            bellName.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            bellName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            bellName.heightAnchor.constraint(equalToConstant: 40),
            bellName.widthAnchor.constraint(equalToConstant: 40),
            
            bellTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            bellTitle.leadingAnchor.constraint(equalTo: bellName.trailingAnchor, constant: padding),
            bellTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            bellTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding)
        ])
    }
    
}
