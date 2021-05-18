//
//  SignInView.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/14/21.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        AuthLayoutView {
            SignInHeaderView()
        } content: {
            VStack(spacing: 0) {
                SignInContentView()
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
