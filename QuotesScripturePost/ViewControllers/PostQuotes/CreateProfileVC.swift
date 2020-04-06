//
//  CreateProfileVC.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/22.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit
import FirebaseAuth

class CreateProfileVC: UIViewController {
    
    var createUserImage = UIImageView()
    let createUserLabel = QSLabel(textAlignment: .center, string: "Welcome \n Please set a username")
    let createUserTextField = QSTextField()
    let createUserProfileButton = QSButton(title: "Select your image profile")
    let createUserButton = QSButton(title: "Create!")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    func configure() {
        view.backgroundColor = .systemBackground
        view.addSubview(createUserImage)
        view.addSubview(createUserLabel)
        view.addSubview(createUserTextField)
        view.addSubview(createUserProfileButton)
        view.addSubview(createUserButton)
        
        createUserImage.backgroundColor = .systemPink
        
        //改行をして全文を表示
        createUserLabel.numberOfLines = 0
        
        //TextFieldの機能を設定
        createUserTextField.returnKeyType = .done
        createUserTextField.delegate = self
        
        createUserButton.addTarget(self, action: #selector(createUser), for: .touchUpInside)
        createUserProfileButton.addTarget(self, action: #selector(createProfileImage), for: .touchUpInside)
        
        createUserImage.translatesAutoresizingMaskIntoConstraints = false
        createUserLabel.translatesAutoresizingMaskIntoConstraints = false
        createUserTextField.translatesAutoresizingMaskIntoConstraints = false
        createUserProfileButton.translatesAutoresizingMaskIntoConstraints = false
        createUserButton.translatesAutoresizingMaskIntoConstraints = false
        
        let padding:CGFloat = 40
        
        NSLayoutConstraint.activate([
            createUserImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            createUserImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.size.width/2-100),
            createUserImage.widthAnchor.constraint(equalToConstant: 200),
            createUserImage.heightAnchor.constraint(equalToConstant: 200),
            
            
            createUserLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.frame.height/10),
            createUserLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            createUserLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            createUserLabel.heightAnchor.constraint(equalToConstant: 50),
            
            createUserTextField.topAnchor.constraint(equalTo: createUserLabel.bottomAnchor, constant: padding),
            createUserTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            createUserTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            createUserTextField.heightAnchor.constraint(equalToConstant: 50),
            
            createUserProfileButton.topAnchor.constraint(equalTo: createUserTextField.bottomAnchor, constant: padding),
            createUserProfileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            createUserProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            createUserProfileButton.heightAnchor.constraint(equalToConstant: 50),
            
            createUserButton.topAnchor.constraint(equalTo: createUserProfileButton.bottomAnchor, constant: padding),
            createUserButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            createUserButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            createUserButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func createProfileImage() {
        //ここに写真選択関係のポップアップViewを出す
        showActionSheet()
        //UserProfileはプリセットも用意しておく
    }
    
    
    //ここでユーザー情報を作成する
    // TODO: ここに写真を追加。なければプレースホルダーを設定
    //　ユーザーの写真はURLを統一化して変更できるようにすること
    @objc func createUser() {
        //uidを取得するため、現在のユーザーがログインしているかを確認
        guard let authCurrentUser = Auth.auth().currentUser else {
            print("ユーザーはログインしていません")
            return
        }
        // ユーザー名が適切かを確認する。
        let username = createUserTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        guard username != nil && username != "" else {
            print("ユーザー名が入力されていません")
            return
        }
        
        guard let userImagePhoto = createUserImage.image else { return }
        //ユーザープロフィールを作成する
        UserService.createUserProfile(userId: authCurrentUser.uid, username: username!,userImagePhoto: userImagePhoto  { (u) in
            //すでにユーザーが作成されているのかを確認する
            if u == nil {
                print("プロフィール作成でエラーが発生しました")
            } else {
                //ユーザー情報を保存
                LocalStorageService.saveCurrentUser(user: u!)
                
                //モーダルで投稿画面に遷移、遷移先は全画面に変更
                let selectPostImageVC = SelectPostImageVC()
                selectPostImageVC.modalPresentationStyle = .fullScreen
                self.present(selectPostImageVC, animated: true, completion: nil)
            }
        }
    }
    
    
    func showActionSheet() {
        //アクションシート作成
        let actionSheet = UIAlertController(title: "Select Photo", message: "Please select a source", preferredStyle: .actionSheet)
        
        //カメラの使用許可
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
                self.showImagePicker(type: .camera)
            }
            actionSheet.addAction(cameraAction)
        }
        
        //アルバムの使用
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let libraryAction = UIAlertAction(title: "Photo Library", style: .default) { (action) in
                self.showImagePicker(type: .photoLibrary)
            }
            actionSheet.addAction(libraryAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(cancelAction)
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    
    func showImagePicker(type: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = type
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
}


extension CreateProfileVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            //createUserImageへ情報を格納。
            //@objc func createUser()にて、firebaseへ保存
            createUserImage.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}


extension CreateProfileVC: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        createUserTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

