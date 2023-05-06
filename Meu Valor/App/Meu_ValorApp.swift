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
    @StateObject var createViewModel = CreateUserViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(createViewModel)
        }
    }
}
