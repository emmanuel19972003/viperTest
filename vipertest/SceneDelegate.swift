//
//  SceneDelegate.swift
//  vipertest
//
//  Created by Emmanuel Zambrano Quitian on 2/18/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var listaDePeliculasRouter = ListaDePeliculasRouter()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScen = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScen)
        listaDePeliculasRouter.muestaListaDePeliculas(window: window)
    }
}

