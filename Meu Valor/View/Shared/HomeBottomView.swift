//
//  HomeBottomView.swift
//  Meu Valor
//
//  Created by junior leoncio on 04/05/23.
//

import SwiftUI

struct HomeBottomView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            MoneyView()
                .tabItem {
                    Image(systemName: "brazilianrealsign.circle.fill")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle.fill")
                        
                }
                
        }
        
      
        
    }
}

struct HomeBottomView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBottomView()
    }
}
