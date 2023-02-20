//
//  ListaDePeliculasIntereactor.swift
//  vipertest
//
//  Created by Emmanuel Zambrano Quitian on 2/18/23.
//

import Foundation
//fcd80027e97416f6d71250e696cc50ba
class ListaDePeliculasIntereactor {
    func getListaDePeliculas() async -> PeliculasPopularesResponse {
        print("estamos haceindo la llamada")
        let url = URL(string:"https://api.themoviedb.org/3/movie/popular?api_key=fcd80027e97416f6d71250e696cc50ba")!
        let (data,_) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PeliculasPopularesResponse.self, from: data)
    }
}
