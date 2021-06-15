//
//  UserField.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/16/21.
//

import SwiftUI

struct UserField: View {
    let fieldType: FieldType
    @Binding var textValue: String
    
    private let shadowRadius: CGFloat = 8
    private let shadowOffset = CGPoint(x: 6, y: 6)
    private let rectRadius: CGFloat = 17
    private let fieldHeight: CGFloat = 48
    private let fieldSideMargin: CGFloat = 20
    
    var body: some View {
        Text(fieldType.placeholder)
            .font(.footnote)
            .foregroundColor(Color(Asset.Colors.spindleGrey.color))
            .padding(.top)
        
        ZStack {
            BWNeumorphicRectangle(rectRadius: rectRadius,
                                  color: Color(Asset.Colors.solitudeGrey.color),
                                  shadowRadius: shadowRadius,
                                  shadowOffset: shadowOffset)
            UserField()
        }
    }
}

private extension UserField {
    func UserField() -> some View {
        viewFor(field: fieldType)
            .background(Color(Asset.Colors.solitudeGrey.color))
            .frame(height: fieldHeight, alignment: .center)
            .cornerRadius(rectRadius)
            .padding([.leading, .trailing], fieldType == .birthDate ? 0 : fieldSideMargin)
    }

    @ViewBuilder
    func viewFor(field: FieldType) -> some View {
        switch field {
        case .email:
            TextField(field.placeholder, text: $textValue)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .modifier(PlaceholderStyle(showPlaceHolder: textValue.isEmpty,
                                           placeholder: fieldType.placeholder))
        case .lastName, .firstName, .contactNumber:
            TextField(field.placeholder, text: $textValue)
                .modifier(PlaceholderStyle(showPlaceHolder: textValue.isEmpty,
                                           placeholder: fieldType.placeholder))
        case .password:
            SecureField(field.placeholder, text: $textValue)
                .modifier(PlaceholderStyle(showPlaceHolder: textValue.isEmpty,
                                           placeholder: fieldType.placeholder))
        case .newPassword:
            SecureField(field.placeholder, text: $textValue)
                .modifier(PlaceholderStyle(showPlaceHolder: textValue.isEmpty,
                                           placeholder: fieldType.placeholder))
        case .confirmNewPassword:
            SecureField(field.placeholder, text: $textValue)
                .modifier(PlaceholderStyle(showPlaceHolder: textValue.isEmpty,
                                           placeholder: fieldType.placeholder))
        case .birthDate:
            BirthdateField(textValue: $textValue, placeholder: field.placeholder)
        case .address:
            TextField(field.placeholder, text: $textValue)
                .modifier(PlaceholderStyle(showPlaceHolder: textValue.isEmpty,
                                           placeholder: fieldType.placeholder))
        }
    }
}

struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                    .italic()
                    .foregroundColor(.secondary)
            }
            content
                .foregroundColor(Color.black)
        }
    }
}
