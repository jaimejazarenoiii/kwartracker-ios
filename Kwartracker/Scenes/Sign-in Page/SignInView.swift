//
//  SignInView.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/14/21.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var store: AppStore
    
    var body: some View {
        SkeletalView(header: {
            SignInHeaderView()
        }, body: {
            SignInContentView()
                .environmentObject(store)
        })
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
