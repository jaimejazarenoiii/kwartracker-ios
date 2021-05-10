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
        Text(fieldType.text)
            .font(.footnote)
            .foregroundColor(Color(Asset.Colors.spindleGrey.color))
            .padding(.top)
        
        ZStack {
            BWNeumorphicRectangle(rectRadius: rectRadius,
                                  color: Color(Asset.Colors.solitudeGrey.color),
                                  shadowRadius: shadowRadius,
                                  shadowOffset: shadowOffset)
            
            UserField
        }
    }
    
    var UserField: some View {
        createField(for: fieldType)
            .modifier(PlaceholderStyle(showPlaceHolder: textValue.isEmpty,
                                       placeholder: fieldType.placeholder))
            .background(Color(Asset.Colors.solitudeGrey.color))
            .frame(height: fieldHeight, alignment: .center)
            .cornerRadius(rectRadius)
            .padding([.leading, .trailing], fieldSideMargin)
    }
    
    func createField(for field: FieldType) -> some View {
        if field == .email {
            return AnyView(TextField("", text: $textValue))
        } else {
            return AnyView(SecureField("", text: $textValue))
        }
    }
    
    enum FieldType {
        case email
        case password
        
        var text: String {
            switch self {
            case .email:
                return L10n.SignUpPage.Label.email
            case .password:
                return L10n.SignUpPage.Label.password
            }
        }
        
        var placeholder: String {
            switch self {
            case .email:
                return L10n.SignInPage.Field.enterEmailAddress
            case .password:
                return L10n.SignInPage.Field.enterPassword
            }
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
