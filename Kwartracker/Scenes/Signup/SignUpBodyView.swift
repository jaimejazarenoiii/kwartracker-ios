//
//  SignUpBodyView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/15/21.
//

import SwiftUI

struct SignUpBodyView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(L10n.Create.account).foregroundColor(Color(Asset.Colors.nightRider.color))
                    .font(.system(size: 40))
                    .fontWeight(.medium)
                    .fixedSize(horizontal: false, vertical: true)
                UserField(textLabel: L10n.email, textValue: $email)
                UserField(textLabel: L10n.password, textValue: $password)
                SNSButton(action: .signUp).padding(.top, 15)
                HStack {
                    Spacer()
                    Text(L10n.or)
                    Spacer()
                 }.padding(.top, 5)
                SNSButton(action: .google).padding(.top, 5)
                SNSButton(action: .apple).padding(.top, 10)
                HStack {
                    Spacer()
                    Button(action: {
                    }) {
                        Text(L10n.Sign.In.As.guest)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                            .underline()
                    }
                }
                .padding([.leading, .top], 20)
            }
            .padding([.leading, .trailing], 30)
            .padding(.top, 70)
        }
    }
}

struct SignUpBodyView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpBodyView()
            .background(Color(Asset.Colors.solitudeGrey.color))
            .previewLayout(.sizeThatFits)
    }
}

struct UserField: View {
    let textLabel: String
    @Binding var textValue: String
    
    var body: some View {
        Text(textLabel)
            .font(.footnote)
            .foregroundColor(.secondary)
            .padding(.top)
        
        ZStack {
            let radius: CGFloat = 17
            
            RoundedRectangle(cornerRadius: radius)
                .fill(Color(Asset.Colors.solitudeGrey.color))
                .frame(height: 50, alignment: .center)
                .shadow(color: Color.black.opacity(0.2), radius: radius, x: 7, y: 7)
                .shadow(color: Color.white.opacity(0.7), radius: radius, x: -5, y: -5)
            
            if textLabel == L10n.email {
                TextField("", text: $textValue)
                    .modifier(PlaceholderStyle(showPlaceHolder: textValue.isEmpty,
                                               placeholder: L10n.Enter.Email.address))
                    .background(Color(Asset.Colors.solitudeGrey.color))
                    .frame(height: 50, alignment: .center)
                    .cornerRadius(radius)
                    .padding([.leading, .trailing], 20)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
            } else {
                SecureField("", text: $textValue)
                    .modifier(PlaceholderStyle(showPlaceHolder: textValue.isEmpty,
                                               placeholder: L10n.Enter.password))
                    .background(Color(Asset.Colors.solitudeGrey.color))
                    .frame(height: 50, alignment: .center)
                    .cornerRadius(radius)
                    .padding([.leading, .trailing], 20)
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

struct SNSButton: View {
    let action: SNSType
    
    var body: some View {
        Button(action: {
            
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 17)
                    .fill(action.color)
                    .frame(height: 55)
                
                HStack {
                    Image(action.image)
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                    
                    Text(action.nameValue)
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                }
            }
        })
    }
}

