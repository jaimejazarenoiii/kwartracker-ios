//
//  WalletPageView.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 4/20/21.
//

import SwiftUI

struct WalletPageView: View {
    var body: some View {
        VStack {
            ScrollView(showsIndicators: true) {
                VStack {
                    WalletCardScrollView()
                    WalletActionButtonView()
                }
            }
            
        }
    }
}

struct WalletPageView_Previews: PreviewProvider {
    static var previews: some View {
        WalletPageView()
    }
}
