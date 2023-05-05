//
//  SplashView.swift
//  Meu Valor
//
//  Created by junior leoncio on 05/05/23.
//

import SwiftUI

struct SplashView: View {
  
    @EnvironmentObject var viewModel: CreateUserViewModel
    
    var body: some View {
       
        Group {
            if viewModel.userSession != nil {
                HomeBottomView()
            } else {
                LoginView()
            }
        }
       
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .environmentObject(CreateUserViewModel())
        
    }
}

