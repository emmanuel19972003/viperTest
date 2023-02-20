//
//  ListaDepeliculasView.swift
//  vipertest
//
//  Created by Emmanuel Zambrano Quitian on 2/18/23.
//

import Foundation
import UIKit

class ListaDepeliculasView: UIViewController {
    
    var presenter: ListaDePeliculasPresenter?
    
    private let peliculasTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(CeldaDePeliculas.self, forCellReuseIdentifier: "celdaDePeliculas")
        return tableView
    }()
    
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("view did not load")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupTableView()
        presenter?.onViewAppear()
    }
    
    
    private func setupTableView() {
        view.addSubview(peliculasTableView)
        
        NSLayoutConstraint.activate([
            peliculasTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            peliculasTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            peliculasTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            peliculasTableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        peliculasTableView.dataSource = self
    }
}
extension ListaDepeliculasView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        (presenter?.models.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaDePeliculas", for: indexPath) as! CeldaDePeliculas
        cell.backgroundColor = .red
        let model = presenter!.models[indexPath.row]
        cell.setUpViews()
        cell.configuracion(pelicula: model)
        return cell
    }
    
    
}
extension ListaDepeliculasView: LsitaDePeliculasUI {
    func update(peliculas: [PeliculasPopularesModel]) {
        DispatchQueue.main.async {
            self.peliculasTableView.reloadData()
        }
    }
}
