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
    
    var body: some View {
        VStack(alignment: .leading) {
            UserField(textLabel: L10n.newPassword, textValue: $password)
            Spacer().padding(.bottom, 20)
            UserField(textLabel: L10n.confirmNewPassowrd, textValue: $confirmPassword)
            Spacer()
        }
        .padding([.leading, .trailing], 30)
        .padding(.top, 40)
    }
}

struct ChangePasswordBodyView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordBodyView()
    }
}
