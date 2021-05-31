//
//  MyProfileContentView.swift
//  Kwartracker
//
//  Created by John Ellie Go on 5/28/21.
//

import SwiftUI

struct MyProfileContentView: View {
    let name: String = L10n.ProfilePage.dummyName
    
    var body: some View {
        VStack(alignment: .leading) {
            EditButtonView()
                .padding(.horizontal, -15)
            
            ZStack {
                NeumorphicEffect(rectSize: CGSize(width: UIScreen.main.bounds.width-60, height: 190))
                
                VStack {
                    ProfilePictureView()
                    
                    Text(name)
                        .font(.system(size: 15))
                        .padding(.top)
                }
            }
            .padding([.top, .bottom])
            
            ProfileDetailsLabel(label: L10n.ProfilePage.Label.contactNumber, value: L10n.ProfilePage.dummyNumber)
            
            ProfileDetailsLabel(label: L10n.ProfilePage.Label.birthdate, value: L10n.ProfilePage.dummyBirthdate)
            
            ProfileDetailsLabel(label: L10n.ProfilePage.Label.address, value: L10n.ProfilePage.dummyAddress)
            
            Spacer()
        }
        .padding([.leading, .trailing], 30)
        .padding(.top, 15)
    }
}

struct MyProfileContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileContentView()
            .previewLayout(.sizeThatFits)
    }
}

private struct ProfileDetailsLabel: View {
    let label: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.footnote)
                .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                .padding(.top)
            
            Text(value)
                .font(.system(size: 15))
                .padding(.top, 1)
        }
    }
}
