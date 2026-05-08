//
//  ContentView.swift
//  Desafio11
//
//  Created by Turma01-7 on 07/05/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
            ZStack{
                Color("fundo")
                    .ignoresSafeArea()
                ScrollView{
                    VStack{
                    Text("Ias Truck")
                        .font(.system(size: 40,design: .serif))
                        .foregroundStyle(Color("fundo2"))
                        .fontWeight(.bold)
                        
                    Spacer()
                    
//                    ForEach( viewModel.info.sorted {
//                        
//                        let ordem = [
//                            "Entrada": 0,
//                            "Principal": 1,
//                            "Sobremesa": 2,
//                            "Bebidas": 3
//                        ]
//                        
//                        return ordem[$0.type, default: 99] < ordem[$1.type, default: 99]
//                        
//                    }, id: \.self){ c in
//                            ListaView(comidinha: c)
//                    }
                        VStack(alignment: .leading){
                            Text("ENTRADA")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            
                            ForEach(viewModel.info.filter({$0.type == "Entrada"}), id: \._id){ item in
                                
                                ListaView(comidinha: item)
                            }
                            
                            Spacer()
                            
                            Text("PRINCIPAL")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                
                            
                            ForEach(viewModel.info.filter({$0.type == "Principal"}), id: \._id){ item in
                                
                                ListaView(comidinha: item)
                            }
                            
                            Spacer()
                            
                            Text("SOBREMESA")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            
                            ForEach(viewModel.info.filter({$0.type == "Sobremesa"}), id: \._id){ item in
                                
                                ListaView(comidinha: item)
                            }
                            
                            Spacer()
                            
                            Text("BEBIDAS")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            
                            ForEach(viewModel.info.filter({$0.type == "Bebidas"}), id: \._id){ item in
                                
                                ListaView(comidinha: item)
                            }
                            
                        }
                        .padding(.horizontal)
                }
            }
            .onAppear(){
                viewModel.fetch()
            }
        }
    }
}

#Preview {
    ContentView()
}
