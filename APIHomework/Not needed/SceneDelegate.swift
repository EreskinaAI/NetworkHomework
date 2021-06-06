//
//  SceneDelegate.swift
//  APIHomework
//
//  Created by Анна Ереськина on 02.06.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        let startVC = FilmsVC(networkService: NetworkService())
        window.rootViewController = UINavigationController(rootViewController: startVC)
        
        self.window = window
        window.makeKeyAndVisible()
    }
}

