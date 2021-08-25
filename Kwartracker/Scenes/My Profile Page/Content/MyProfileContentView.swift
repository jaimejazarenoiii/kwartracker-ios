//
//  MyProfileContentView.swift
//  Kwartracker
//
//  Created by John Ellie Go on 5/28/21.
//

import SwiftUI

struct MyProfileContentView: View {
    @EnvironmentObject private var store: AppStore

    private let neumorphicBoxHeight: CGFloat = 190
    private let horizontalMargin: CGFloat = 30
    private let topMargin: CGFloat = 15
    private let editHorizontalMargin: CGFloat = -15
    
    var body: some View {
        VStack(alignment: .leading) {
            TopRightButtonView(image: Asset.Images.editIcon.image, btnAction: {})
                .padding(.horizontal, editHorizontalMargin)
            
            MyProfileCardView(user: store.state.userProfileState.user)
            MyProfileDetailView(user: store.state.userProfileState.user)
            
            Spacer()
        }
        .padding([.leading, .trailing], horizontalMargin)
        .padding(.top, topMargin)
    }
}

struct MyProfileContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileContentView()
            .previewLayout(.sizeThatFits)
    }
}

private struct MyProfileCardView: View {
    let user: FetchProfileQuery.Data.Profile?

    private let cardHeight: CGFloat = 190
    private let fontSize: CGFloat = 15
    private let horizontalMargin: CGFloat = 30
    private let verticalMargin: CGFloat = 10
    private var name: String {
        "\(self.user?.firstName ?? "") \(user?.middleName ?? "") \(user?.lastName ?? "")"
    }
    
    var body: some View {
        ZStack {
            NeumorphicEffect(rectSize: CGSize(width: UIScreen.main.bounds.width - (horizontalMargin * 2),
                                              height: cardHeight))
            
            VStack {
                ProfilePictureView()
            
                Text(name)
                    .font(.system(size: fontSize))
                    .padding(.top)
            }
        }
        .frame(height: cardHeight)
        .padding(.vertical, verticalMargin)
    }
}


private struct MyProfileDetailView: View {
    let user: FetchProfileQuery.Data.Profile?

    var body: some View {
        Group {
            ProfileDetailsLabel(
                label: L10n.ProfilePage.Label.contactNumber,
                value: user?.email ?? ""
            )
            ProfileDetailsLabel(label: L10n.ProfilePage.Label.birthdate, value: L10n.ProfilePage.dummyBirthdate)
            ProfileDetailsLabel(label: L10n.ProfilePage.Label.address, value: L10n.ProfilePage.dummyAddress)
        }
    }
}


private struct ProfileDetailsLabel: View {
    let label: String
    let value: String
    private let fontSize: CGFloat = 15
    private let topMargin: CGFloat = 1
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.footnote)
                .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                .padding(.top)
            
            Text(value)
                .font(.system(size: fontSize))
                .padding(.top, topMargin)
        }
    }
}
