//
//  SignUpView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/15/21.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        VStack {
            SignUpHeaderView().background(Color("Teal"))
            SignUpBodyView()
            SignUpFooterView()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
