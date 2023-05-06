//
//  EditHomeView.swift
//  Meu Valor
//
//  Created by junior leoncio on 05/05/23.
//

import SwiftUI

struct EditHomeView: View {
    @State var salary: Double = 0
    @State var dayJobMonth: Double = 0
    @State var dayForWeek: Double = 0
    @State var hourJobForDay: Double = 0
    @Binding var isPresented: Bool
    
    @StateObject var editViewModel = EditHomeViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Insira os dados correspondentes corretamente para saber o calculo das suas horas.")
                .multilineTextAlignment(.center)
                .font(.title)
                .padding(.bottom, 24)
            
            Text("Salário Líquido")
            TextField("", value: $salary, format: .number)
                .padding()
                .background(Color(.systemGray).opacity(0.3).cornerRadius(10))
            Text("Dias trabalhados por mês")
            TextField("", value: $dayJobMonth, format: .number)
                .padding()
                .background(Color(.systemGray).opacity(0.3).cornerRadius(10))
            Text("Dias trabalhados por semana")
            TextField("", value: $dayForWeek, format: .number)
                .padding()
                .background(Color(.systemGray).opacity(0.3).cornerRadius(10))
            Text("Horas trabalhadas por dia")
            TextField("", value: $hourJobForDay, format: .number)
                .padding()
                .background(Color(.systemGray).opacity(0.3).cornerRadius(10))
            
            Button {
                Task {
                    try await editViewModel.updateSalary(salary: salary, dayJobMonth: dayJobMonth, dayForWeek: dayForWeek, hourJobForDay: Double(hourJobForDay))
                }
                isPresented = false
            } label: {
                Text("Salvar")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(.top, 24)
            
                
        }
        .padding()
        .onAppear {
            Task {
                await editViewModel.fetchSalary()
                salary = editViewModel.currentSalary?.salary ?? 1
                dayJobMonth = editViewModel.currentSalary?.dayJobMonth ?? 1
                dayForWeek = editViewModel.currentSalary?.dayForWeek ?? 1
                hourJobForDay = editViewModel.currentSalary?.hourJobForDay ?? 1
            }
        }
    }
}

struct EditDataView_Previews: PreviewProvider {
    static var previews: some View {
        EditHomeView(isPresented: .constant(true))
    }
}
