//
//  SignUpView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/27/21.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        SkeletalView(header: {
            SignInHeaderView()
        }, body: {
            SignUpContentView()
        })
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
