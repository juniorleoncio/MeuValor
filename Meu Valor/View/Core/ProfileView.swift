//
//  ProfileView.swift
//  Meu Valor
//
//  Created by junior leoncio on 04/05/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var profileVM: CreateUserViewModel
    var body: some View {
        if let user = profileVM.currentUser {
            List {
                Section {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .accentColor(.gray)
                        }
                        
                    }
                }
                
                Section("General") {
                    HStack {
                        SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                        
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(Color(.systemGray))
                    }
                }
                
                Section("Account") {
                    Button { profileVM.signOut()} label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: Color(.systemRed))
                    }
                    
                    Button { print("Delete account...")} label: {
                        SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: Color(.systemRed))
                    }
                    
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    
    static var previews: some View {
        ProfileView()
            .environmentObject(CreateUserViewModel())
            
    }
}
