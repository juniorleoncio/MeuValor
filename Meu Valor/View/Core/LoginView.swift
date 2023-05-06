//
//  LoginView.swift
//  Meu Valor
//
//  Created by junior leoncio on 04/05/23.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var createViewModel: CreateUserViewModel
    var body: some View {
        NavigationStack {
            
            Text("Meu Valor")
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .padding(.top, 120)
            
            
            TextField("Email", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.top, 100)
            
            SecureField("Senha", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            
            Button {
                Task {
                  try await createViewModel.signIn(withEmail: email, password: password)
                }
            } label: {
                Text("Log In")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(.top, 40)
            
            Spacer()
            
           
            
            HStack {
                NavigationLink(destination: RegisterView().navigationBarBackButtonHidden(true)) {
                    Text("Não tem uma conta?")
                        .font(.subheadline)
                   
                    Text("Cadastre-se")
                        .font(.headline)
                }
            }
        }
        .padding()
    }
}


extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
    
    
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
