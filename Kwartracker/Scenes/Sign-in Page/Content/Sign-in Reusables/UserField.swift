//
//  UserField.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/16/21.
//

import SwiftUI

struct UserField: View {
    let textLabel: String
    @Binding var textValue: String
    
    var body: some View {
        Text(textLabel)
            .font(.footnote)
            .foregroundColor(Color(Asset.Colors.spindleGrey.color))
            .padding(.top)
        
        ZStack {
            let shadowRadius: CGFloat = 8
            let radius: CGFloat = 17
            
            RoundedRectangle(cornerRadius: radius)
                .fill(Color(Asset.Colors.solitudeGrey.color))
                .frame(height: 48, alignment: .center)
                .cornerRadius(17)
                .shadow(color: Color.white.opacity(1), radius: shadowRadius, x: -6, y: -6)
                .shadow(color: Color.black.opacity(0.15), radius: shadowRadius, x: 7, y: 7)
            
            if textLabel == L10n.email {
                TextField(L10n.Enter.Email.address, text: $textValue)
                    .background(Color(Asset.Colors.solitudeGrey.color))
                    .frame(height: 48, alignment: .center)
                    .cornerRadius(radius)
                    .padding([.leading, .trailing], 20)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
            } else {
                SecureField(L10n.Enter.password, text: $textValue)
                    .background(Color(Asset.Colors.solitudeGrey.color))
                    .frame(height: 48, alignment: .center)
                    .cornerRadius(radius)
                    .padding([.leading, .trailing], 20)
            }
        }
    }
}
