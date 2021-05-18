//
//  ChangePasswordBodyView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 4/15/21.
//

import SwiftUI

struct ChangePasswordBodyView: View {
    private let topMargin: CGFloat = 20

    var body: some View {
        VStack(alignment: .leading) {
            UserFields()
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

private struct UserFields: View {
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    private let horizontalMargin: CGFloat = 15

    var body: some View {
        Group {
            UserField(fieldType: .newPassword, textValue: $password)
                .padding(.horizontal, horizontalMargin)

            Spacer().frame(maxHeight: horizontalMargin)
            
            UserField(fieldType: .confirmNewPassword, textValue: $confirmPassword)
                .padding(.horizontal, horizontalMargin)
        }
    }
}
