//
//  ListaDePeliculasPresenter.swift
//  vipertest
//
//  Created by Emmanuel Zambrano Quitian on 2/18/23.
//

import Foundation

protocol LsitaDePeliculasUI: AnyObject{
    func update(peliculas: [PeliculasPopularesModel])
}

class ListaDePeliculasPresenter {
    var ui: LsitaDePeliculasUI?
    private let listaDePeliculasIntereactor: ListaDePeliculasIntereactor
    var models: [PeliculasPopularesModel] = []
    
    init(listaDePeliculasIntereactor: ListaDePeliculasIntereactor) {
        self.listaDePeliculasIntereactor = listaDePeliculasIntereactor
    }
    
    func onViewAppear() {
        Task{
            models = await listaDePeliculasIntereactor.getListaDePeliculas().results
            ui?.update(peliculas: models)
        }
    }
}
