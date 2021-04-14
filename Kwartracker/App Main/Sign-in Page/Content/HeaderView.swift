//
//  SwiftUIView.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/14/21.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 50, height: 50, alignment: .center)
                Text("k")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(Asset.Colors.teal.color))
            }
            
            Text("kwartracker")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            
            Spacer()
        }
        .padding(.leading, 50)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
