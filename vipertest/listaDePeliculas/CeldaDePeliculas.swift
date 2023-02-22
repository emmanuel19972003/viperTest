//
//  caldaDePeliculas.swift
//  vipertest
//
//  Created by Emmanuel Zambrano Quitian on 2/18/23.
//

import Foundation
import UIKit
import Kingfisher

class CeldaDePeliculas: UITableViewCell {
    let imagenDeLaPelicula: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let movieName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 32,
                                 weight: .bold,
                                 width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12,
                                 weight: .regular,
                                 width: .standard)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        addSubview(imagenDeLaPelicula)
        addSubview(movieName)
        addSubview(movieDescription)
        
        NSLayoutConstraint.activate([
            imagenDeLaPelicula.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            imagenDeLaPelicula.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            imagenDeLaPelicula.heightAnchor.constraint(equalToConstant: 200),
            imagenDeLaPelicula.widthAnchor.constraint(equalToConstant: 100),
            imagenDeLaPelicula.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -12),
            
            
            movieName.leadingAnchor.constraint(equalTo: imagenDeLaPelicula.trailingAnchor, constant: 18),
            movieName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            movieName.topAnchor.constraint(equalTo: imagenDeLaPelicula.topAnchor, constant: 24),
            
            movieDescription.leadingAnchor.constraint(equalTo: imagenDeLaPelicula.trailingAnchor, constant: 20),
            movieDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            movieDescription.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 8),
            movieDescription.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -12),

        ])
    }
    
    func configuracion(pelicula: PeliculasPopularesModel) {
        imagenDeLaPelicula.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w200" + pelicula.imagen))
        movieName.text = pelicula.titulo
        movieDescription.text = pelicula.resumen
    }
    
}
