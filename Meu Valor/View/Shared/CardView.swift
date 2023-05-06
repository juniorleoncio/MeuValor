//
//  CardView.swift
//  Meu Valor
//
//  Created by junior leoncio on 04/05/23.
//

import SwiftUI

struct CardView: View {
    var title: String
    var imageSymbol: String
    var value: Text
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline).bold()
                Text("\(value)")
                    .font(.title).bold()
            }
            .padding()
            
            Spacer()
            
            Image(systemName: imageSymbol)
                .resizable()
                .scaledToFit()
                .foregroundColor(.gray.opacity(0.5))
                .padding()
        }
        .frame(height: 70)
        //.background(Color(.systemGray6))
        .overlay {
            RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 0.2)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "Sua hora vale:", imageSymbol: "brazilianrealsign.circle.fill", value: Text(""))
    }
}
