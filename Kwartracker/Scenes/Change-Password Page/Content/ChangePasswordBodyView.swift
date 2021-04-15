//
//  ChangePasswordBodyView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 4/15/21.
//

import SwiftUI

struct ChangePasswordBodyView: View {
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    private let topMargin: CGFloat = 20
    private let horizontalMargin: CGFloat = 15
    
    private var UserFields: some View {
        Group {
            UserField(fieldType: .newPassword, textValue: $password)
                .padding(.horizontal, horizontalMargin)

            Spacer().frame(maxHeight: horizontalMargin)
            
            UserField(fieldType: .confirmNewPassword, textValue: $confirmPassword)
                .padding(.horizontal, horizontalMargin)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            UserFields

            Spacer()
        }
        .padding()
        .padding(.top, topMargin)
    }
}

struct ChangePasswordBodyView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordBodyView()
    }
}
