//
//  EditDataView.swift
//  Meu Valor
//
//  Created by junior leoncio on 05/05/23.
//

import SwiftUI

struct EditDataView: View {
    @State var salary: Double = 0
    @State var dayJobMonth: Double = 0
    @State var dayForWeek: Double = 0
    @State var hourJobForDay: Double = 0
    
    @EnvironmentObject var viewmodel: CreateUserViewModel
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Salário Líquido")
            TextField("", value: $salary, format: .number)
                .padding()
                .background(Color(.systemGray).opacity(0.3).cornerRadius(10))
            Text("Dias trabalhados por mes")
            TextField("", value: $dayJobMonth, format: .number)
                .padding()
                .background(Color(.systemGray).opacity(0.3).cornerRadius(10))
            Text("Dias trabalhado por semana")
            TextField("", value: $dayForWeek, format: .number)
                .padding()
                .background(Color(.systemGray).opacity(0.3).cornerRadius(10))
            Text("Horas trabalhadas por dia")
            TextField("", value: $hourJobForDay, format: .number)
                .padding()
                .background(Color(.systemGray).opacity(0.3).cornerRadius(10))
            
            Button {
                Task {
                    try await viewmodel.updateSalary(salary: salary, dayJobMonth: dayJobMonth, dayForWeek: dayForWeek, hourJobForDay: Double(hourJobForDay))
                }
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
    }
}

struct EditDataView_Previews: PreviewProvider {
    static var previews: some View {
        EditDataView()
    }
}
