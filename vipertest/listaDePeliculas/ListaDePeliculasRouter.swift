//
//  ListaDePeliculasRouter.swift
//  vipertest
//
//  Created by Emmanuel Zambrano Quitian on 2/18/23.
//

import Foundation
import UIKit

class ListaDePeliculasRouter{
    func muestaListaDePeliculas(window: UIWindow?) {
        let view = ListaDepeliculasView()
        let interactor = ListaDePeliculasIntereactor()
        let presenter = ListaDePeliculasPresenter(listaDePeliculasIntereactor: interactor)
        presenter.ui = view
        view.presenter = presenter
        
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
