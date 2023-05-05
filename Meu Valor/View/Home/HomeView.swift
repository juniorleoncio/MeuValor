//
//  HomeView.swift
//  Meu Valor
//
//  Created by junior leoncio on 04/05/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        VStack(spacing: 10) {
            
            Image(systemName: "brazilianrealsign.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 90)
            
            Text("Sua hora custa:")
                .font(.title).fontDesign(.rounded)
            Text("R$ 6,95")
                .font(.system(size: 40, weight: .bold, design: .rounded))
            
            Spacer()
            
            CardView(title: "Sua hora está valendo:",
                     imageSymbol: "brazilianrealsign.circle.fill",
                     value: "R$ 60,00")
            
            CardView(title: "Seu dia está valendo:", imageSymbol: "brazilianrealsign.circle.fill", value: "R$ 400,00")
            
            CardView(title: "Sua semana está valendo:", imageSymbol: "brazilianrealsign.circle.fill", value: "R$ 1160,00")
            
            CardView(title: "Seu mes está valendo:", imageSymbol: "brazilianrealsign.circle.fill", value: "R$ 5160,00")
            
            Spacer()
            
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


