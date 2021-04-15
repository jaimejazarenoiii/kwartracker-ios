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
            UserField(textLabel: "New password", textValue: $password)
            Spacer().padding(.bottom, 20)
            UserField(textLabel: "Confirm new password", textValue: $confirmPassword)
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
