//
//  Service.swift
//  Desafio11
//
//  Created by Turma01-7 on 07/05/26.
//

import Foundation
import Combine

struct Service{
    func fetchHP(url: URL) -> AnyPublisher<[Comida], Error>{
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Comida].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
