//
//  ComidaModel.swift
//  Desafio11
//
//  Created by Turma01-7 on 07/05/26.
//

import Foundation

struct Comida: Codable, Hashable{
    let _id: String
    let _rev: String
    let type: String
    let nome: String
    let valor: Int
    let foto: String
}
