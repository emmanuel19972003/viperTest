//
//  PeliculasPopularesResponse.swift
//  vipertest
//
//  Created by Emmanuel Zambrano Quitian on 2/18/23.
//

import Foundation

struct PeliculasPopularesResponse: Decodable {
    let results: [PeliculasPopularesModel]
}
