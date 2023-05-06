//
//  ProfileView.swift
//  Meu Valor
//
//  Created by junior leoncio on 04/05/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var createViewModel: CreateUserViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        if let user = createViewModel.currentUser {
            List {
                Section {
                    HStack {
                        Button("< Back") {
                            presentationMode.wrappedValue.dismiss()
                        }
                        
                    }
                }
                .listRowBackground(Color(.systemGray6))
                
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
                    
                    HStack {
                        SettingsRowView(imageName: "gear", title: "Created by", tintColor: Color(.systemGray))
                        
                        Spacer()
                        
                        Text("Junior Leoncio")
                            .font(.headline)
                            .foregroundColor(Color(.systemGray))
                        
                    }
                }
                
               
                
                Section("Account") {
                    Button { createViewModel.signOut()} label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: Color(.systemRed))
                    }
                    
                    
                    
                }
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    
    static var previews: some View {
        ProfileView()
            .environmentObject(CreateUserViewModel())
            
    }
}
