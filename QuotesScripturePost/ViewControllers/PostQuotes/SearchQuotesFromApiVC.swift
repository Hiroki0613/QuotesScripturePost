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
    let quoteTableView = UITableView()
    let toolbar = QSToolBar()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configurePostImage()
        configureLabel()
        configureTextField()
        configureTableView()
        configureToolbar()
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
    
    
    func configureTableView() {
        view.addSubview(quoteTableView)
        quoteTableView.delegate = self
        quoteTableView.dataSource = self
        quoteTableView.frame = CGRect(x: 0, y: view.frame.size.height/2, width: view.frame.size.width, height: view.frame.size.height/2 - 70)
        quoteTableView.register(SearchQuotesCell.self, forCellReuseIdentifier: SearchQuotesCell.reuseID)
        
        let padding:CGFloat = 20
        
        NSLayoutConstraint.activate([
            quoteTableView.topAnchor.constraint(equalTo: quoteTextField.bottomAnchor, constant: padding),
            quoteTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            quoteTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            quoteTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    func configureToolbar() {
        self.view.addSubview(toolbar)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        
        //戻るボタンの実装
        let backButton = UIButton(frame: CGRect(x: 0, y:0, width: 100, height: 100))
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        let backButtonItem = UIBarButtonItem(customView: backButton)
        
        //ボタンを左右に分けるためのスペースの実装
        let flexibleItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        
        //進むボタンの実装
        let nextButton = UIButton(frame: CGRect(x: 0, y:0, width: 100, height: 100))
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(goToNext), for: .touchUpInside)
        let nextButtonItem = UIBarButtonItem(customView: nextButton)
        
        // ツールバーにアイテムを追加する.
        toolbar.items = [backButtonItem,flexibleItem,nextButtonItem]
        
        self.view.addSubview(toolbar)
        
        NSLayoutConstraint.activate([
            toolbar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            toolbar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            toolbar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            toolbar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    // 戻るボタンをクリックした時の処理
       @objc func back() {
           self.presentingViewController?.dismiss(animated: true, completion: nil)
       }
       
       // 進むボタンをクリックした時の処理
       @objc func goToNext() {
           
           let postQuotesVC = PostQuotesVC()
           postQuotesVC.modalPresentationStyle = .fullScreen
           self.present(postQuotesVC, animated: true, completion: nil)
       }
}


extension SearchQuotesFromApiVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchQuotesCell.reuseID, for: indexPath) as! SearchQuotesCell
        
        cell.set(indexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        tableView.estimatedRowHeight = 100
        //UITableView.automaticDimensionでcellの高さを可変にする
        return UITableView.automaticDimension
    }
}
