//
//  ContentView.swift
//  Meu Valor
//
//  Created by junior leoncio on 05/05/23.
//

import SwiftUI

struct ContentView: View {
  
    @EnvironmentObject var createViewModel: CreateUserViewModel
    
    var body: some View {
       
        Group {
            if createViewModel.userSession != nil {
                HomeView()
            } else {
                LoginView()
            }
        }
       
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CreateUserViewModel())
        
    }
}

