//
//  MyProfileView.swift
//  Kwartracker
//
//  Created by John Ellie Go on 5/28/21.
//

import SwiftUI

struct MyProfileView: View {
    var body: some View {
        SkeletalView(header: {
            MyProfileHeaderView()
        }, body: {
            MyProfileContentView()
        })

    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
