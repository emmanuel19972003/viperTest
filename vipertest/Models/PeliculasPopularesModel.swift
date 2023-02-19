//
//  File.swift
//  vipertest
//
//  Created by Emmanuel Zambrano Quitian on 2/18/23.
//

import Foundation
//corregir no se debe hacer dentro del interactor
//fcd80027e97416f6d71250e696cc50ba
struct PeliculasPopularesModel: Decodable {
    let id: Int
    let resumen: String
    let titulo: String
    let imagen: String
    let votos: Double

    enum CodingKeys: String, CodingKey {
        case id
        case resumen = "overview"
        case titulo = "title"
        case imagen = "poster_path"
        case votos = "vote_average"
    }
}
