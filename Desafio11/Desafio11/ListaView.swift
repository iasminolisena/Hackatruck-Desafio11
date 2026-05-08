//
//  ListaView.swift
//  Desafio11
//
//  Created by Turma01-7 on 07/05/26.
//

import SwiftUI
import Translation

struct ListaView: View {
    
    @State private var mostrarTraducao = false
    let comidinha: Comida
    
    var body: some View {
        ZStack(alignment: .leading) {
            //            Text(comidinha.type)
            //                .font(.headline)
            //                .padding(.horizontal)
            //            
            HStack(spacing: 16) {
                AsyncImage(url: URL(string: comidinha.foto)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text(comidinha.nome)
                        .font(.title3)
                        .foregroundStyle(Color.black)
                        .bold()
                    
                    Text("R$ \(comidinha.valor)")
                        .foregroundStyle(Color.white)
                }
                Spacer()
                
                Button(action: {
                    mostrarTraducao = true
                }) {
                    Image(systemName: "translate")
                        .font(.title2)
                }
                .tint(.white)
                .translationPresentation(isPresented: $mostrarTraducao, text: comidinha.nome)
            }
            .padding()
            .background(Color("fundo2").opacity(0.5))
            .cornerRadius(12)
        }
    }
}

#Preview {
    ListaView(comidinha: Comida(_id: "", _rev: "", type: "", nome: "", valor: 0, foto: ""))
}
