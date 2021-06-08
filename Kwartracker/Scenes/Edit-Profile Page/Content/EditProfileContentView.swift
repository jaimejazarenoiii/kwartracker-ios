//
//  EditProfileContentView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 4/29/21.
//

import SwiftUI

struct EditProfileContentView: View {
    let fieldSideMargin: CGFloat = 25

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                ProfileImage()
                UserFields()
                Spacer()
            }
            .padding(.horizontal, fieldSideMargin)
        }
    }
}

struct EditProfileContentView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileContentView()
    }
}

private struct UserFields: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var contactNumber: String = ""
    @State private var birthDate: String = ""
    @State private var address: String = ""

    var body: some View {
        Group {
            UserField(fieldType: .lastName, textValue: $lastName)
            UserField(fieldType: .firstName, textValue: $firstName)
            UserField(fieldType: .contactNumber, textValue: $contactNumber)
            UserField(fieldType: .birthDate, textValue: $birthDate)
            UserField(fieldType: .address, textValue: $address)
        }
    }
}

private struct ProfileImage: View {
    let fontSize: CGFloat = 12
    let topMargin: CGFloat = 50

    var body: some View {
        Button(action: {}, label: {
            VStack {
                ProfilePictureView()
    
                Text(L10n.EditProfilePage.Button.changePhoto)
                    .font(.system(size: fontSize))
                    .foregroundColor(Color(Asset.Colors.spindleGrey.color))
            }
        })
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.bottom)
        .padding(.top, topMargin)
    }
}
