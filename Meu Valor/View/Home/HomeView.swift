//
//  HomeView.swift
//  Meu Valor
//
//  Created by junior leoncio on 04/05/23.
//


import SwiftUI

struct HomeView: View {
 
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Meu Valor")
                    .font(.title2).fontWeight(.bold).fontDesign(.rounded)
                
                Spacer()
                
                Button { homeViewModel.isPresentig.toggle()} label: {
                    Image(systemName: "person.circle.fill")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                .fullScreenCover(isPresented: $homeViewModel.isPresentig) {
                    ProfileView()
                }
            }
         
            Spacer()
            
            Image(systemName: "brazilianrealsign.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 90)
                .padding(.bottom, 24)
            
            
            
            if let hourlySalary = homeViewModel.calculateHourlySalary() {
                CardView(title: "Seu hora trabalhada vale:",
                         imageSymbol: "brazilianrealsign.circle.fill",
                         value: Text("R$ \(hourlySalary, specifier: "%.2f")"))
                   
            } else {
                Text("Não foi possível calcular o valor da hora, atualize seus dados.")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.bottom, 24)
            }
            
           
            if let dayPerSalary = homeViewModel.calculateDaySalary() {
                CardView(title: "Seu dia trabalhado vale:",
                         imageSymbol: "brazilianrealsign.circle.fill",
                         value: Text("R$ \(dayPerSalary, specifier: "%.2f")"))
            } else {
                Text("Não foi possível calcular o valor do seu dia, atualize seus dados.")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.bottom, 24)
            }
            
            if let weekPerSalary = homeViewModel.calculateWeekSalary() {
                CardView(title: "Sua semana trabalhada vale:",
                         imageSymbol: "brazilianrealsign.circle.fill",
                         value: Text("R$ \(weekPerSalary, specifier: "%.2f")"))
            } else {
                Text("Não foi possível calcular o valor da sua semana, atualize seus dados.")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.bottom, 24)
            }
            
            if let liquidSalary = homeViewModel.currentSalary?.salary {
                CardView(title: "Seu mês trabalhado vale:",
                         imageSymbol: "brazilianrealsign.circle.fill",
                         value: Text("R$ \(liquidSalary, specifier: "%.2f")"))
            } else {
                Text("Não foi possível calcular o valor do seu mês, atualize seus dados.")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.bottom, 24)
            }
            
            
            Button {
                homeViewModel.isUpdate = true
            } label: {
                Label("Atualizar Dados", systemImage: "tray.and.arrow.down")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(.top, 24)
            .sheet(isPresented: $homeViewModel.isUpdate) {
                EditHomeView(isPresented: $homeViewModel.isUpdate)
                    .onDisappear {
                        
                        Task {
                           await homeViewModel.fetchSalary()
                        }
                    }
            }
            
            Spacer()
        }
        .padding()
        .task {
            await homeViewModel.fetchSalary()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



