//
//  Meu_ValorApp.swift
//  Meu Valor
//
//  Created by junior leoncio on 04/05/23.
//

import SwiftUI
import Firebase

@main
struct Meu_ValorApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    @StateObject var viewModel = CreateUserViewModel()
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(viewModel)
        }
    }
}
