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
            .background(Color(Asset.Colors.solitudeGrey.color))
            .frame(height: fieldHeight, alignment: .center)
            .cornerRadius(rectRadius)
            .padding([.leading, .trailing], fieldSideMargin)
    }
    
    func createField(for field: FieldType) -> some View {
        if field == .email {
            return AnyView(TextField(field.text, text: $textValue))
        } else {
            return AnyView(SecureField(field.text, text: $textValue))
        }
    }
    
    enum FieldType {
        case email
        case password
        
        var text: String {
            switch self {
            case .email:
                return L10n.SignInPage.Field.enterEmailAddress
            case .password:
                return L10n.SignInPage.Field.enterPassword
            }
        }
    }
}
