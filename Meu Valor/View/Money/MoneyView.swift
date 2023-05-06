//
//  MoneyView.swift
//  Meu Valor
//
//  Created by junior leoncio on 04/05/23.
//

import SwiftUI

struct MoneyView: View {
    var body: some View {
        HStack {
            Text("Meu Valor")
                .font(.title).fontWeight(.bold).fontDesign(.rounded)
            
            Spacer()
            
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 30)
        }
    }
}

struct MoneyView_Previews: PreviewProvider {
    static var previews: some View {
        MoneyView()
    }
}
