//
//  HomeView.swift
//  Meu Valor
//
//  Created by junior leoncio on 04/05/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Valor da sua hora")
                        .font(.headline)
                    Text("R$ 60,00")
                        .font(.title2).bold()
                        
                }
            }
            
            Section {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Valor da sua hora")
                        .font(.headline)
                    Text("R$ 60,00")
                        .font(.title2).bold()
                        
                }
            }
            
            Section {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Valor da sua hora")
                        .font(.headline)
                    Text("R$ 60,00")
                        .font(.title2).bold()
                        
                }
            }
            
            Section {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Valor da sua hora")
                        .font(.headline)
                    Text("R$ 60,00")
                        .font(.title2).bold()
                        
                }
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
