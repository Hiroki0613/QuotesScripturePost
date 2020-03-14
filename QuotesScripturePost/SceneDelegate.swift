//
//  SceneDelegate.swift
//  QuotesScripturePost
//
//  Created by 近藤宏輝 on 2020/03/14.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //didFinishLaunchingOptionと同じもの
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabbar()
        window?.makeKeyAndVisible()
    }
    
    func createHomeVC() -> UIViewController {
        let homeVC = HomeVC()
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: SFSymbols.home), tag: 0)
        
        return homeVC
    }
    
    
    func createBellVC() -> UIViewController {
        let bellVC = BellVC()
        bellVC.tabBarItem = UITabBarItem(title: SFSymbols.bell, image: UIImage(systemName: "bell"), tag: 1)
        
        return bellVC
    }
    
    
    func createEditVC() -> UIViewController {
        let eidtVC = EditVC()
        eidtVC.tabBarItem = UITabBarItem(title: SFSymbols.edit, image: UIImage(systemName: "gear"), tag: 0)
        
        return eidtVC
    }
    
    
    
    func createTabbar() -> UITabBarController {
        //tabarをインスタンス化
        let tabbar = UITabBarController()
        

        //tabbarにつけるViewControllerを実装
        tabbar.viewControllers = [createHomeVC(), createBellVC(), createEditVC()]
        
        return tabbar
    }
    

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

