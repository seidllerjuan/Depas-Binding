//
//  Departamento.swift
//  MyApp
//
//  Created by WIN603 on 07/10/26.
//

import Foundation

struct Departamento: Identifiable {
    let id = UUID()
    let ubicacion: String
    let imagen: String
    let precio: String
    var esFavorito: Bool = false
}
