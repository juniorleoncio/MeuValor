//
//  RegisterView.swift
//  Meu Valor
//
//  Created by junior leoncio on 04/05/23.
//

import SwiftUI

struct RegisterView: View {
    
    @State var fullname = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var createVM: CreateUserViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Text("Meu Valor")
                .font(.system(size: 40, weight: .bold, design: .rounded))
            Spacer()
            
            TextField("Nome Completo", text: $fullname)
                .padding()
                .background(Color(.systemGray).opacity(0.3).cornerRadius(10))
            
            
            TextField("Email", text: $email)
                .padding()
                .background(Color(.systemGray).opacity(0.3).cornerRadius(10))
            
            SecureField("Senha", text: $password)
                .padding()
                .background(Color(.systemGray).opacity(0.3).cornerRadius(10))
            
            ZStack(alignment: .trailing) {
                SecureField("Confirme a Senha", text: $confirmPassword)
                    .padding()
                    .background(Color(.systemGray).opacity(0.3).cornerRadius(10))
                
                if !password.isEmpty && !confirmPassword.isEmpty {
                    if password == confirmPassword {
                        Image(systemName: "checkmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemGreen))
                            .padding(.trailing, 8)
                    } else {
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemRed))
                            .padding(.trailing, 8)
                    }
                }
                    
            }
        
            
            
            Button {
                Task {
                   try await createVM.createUser(withEmail: email, password: password, fullname: fullname)
                }
            } label: {
                Text("Cadastre-se")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(.top, 40)
            
            Spacer()
            
            
            HStack {
                Text("Já tem uma conta?")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                Button{ dismiss()} label: {
                    Text("Log In")
                        .font(.headline)
                }
            }
        }
        .padding()
    }
}

extension RegisterView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !fullname.isEmpty
    }
    
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
