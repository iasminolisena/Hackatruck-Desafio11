//
//  ViewModel.swift
//  Desafio11
//
//  Created by Turma01-7 on 07/05/26.
//

import Foundation
import Combine

class ViewModel: ObservableObject{
    
    @Published var info: [Comida] = []
    
    private let service = Service()
    private var cancellables = Set<AnyCancellable>()
    
    func fetch() {
        guard let url = URL(string: "http://127.0.0.1:1880/ver") else{
            return
        }
        service.fetchHP(url: url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {_ in}) { comidas in
                self.info = comidas
            }
            .store(in: &cancellables)
    }
}

