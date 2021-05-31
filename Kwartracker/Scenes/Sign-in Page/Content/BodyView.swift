//
//  SwiftUIView.swift
//  Kwartracker
//
//  Created by John Ellie Go on 4/14/21.
//

import SwiftUI

struct BodyView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Welcome\nBack")
                .foregroundColor(Color(Asset.Colors.nightRider.color))
                .font(.system(size: 40))
                .fontWeight(.medium)
                .fixedSize(horizontal: false, vertical: true)
            
            UserField(textLabel: "Email", textValue: $email)
            UserField(textLabel: "Password", textValue: $password)
            
            SNSButton(action: "Sign in").padding(.top, 15)
            
            HStack {
                Spacer()
                Text("or")
                Spacer()
            }.padding(.top, 5)
            
            SNSButton(action: "Sign in with Google").padding(.top, 5)
            
            SNSButton(action: "Sign in with Apple").padding(.top, 10)
            
            HStack {
                Text("Recover Password")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .underline()
                
                Spacer()
                
                Text("Sign in as guest")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .underline()
            }.padding(.top, 20)
            
            Spacer()
        }
        .padding([.leading, .trailing], 30)
        .padding(.top, 70)
    }
}

struct BodyView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView()
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
                .frame(height: 55, alignment: .center)
                .shadow(color: Color.black.opacity(0.2), radius: radius, x: 7, y: 7)
                .shadow(color: Color.white.opacity(0.7), radius: radius, x: -5, y: -5)
            
            if textLabel == "Email" {
                TextField("", text: $textValue)
                    .background(Color(Asset.Colors.solitudeGrey.color))
                    .frame(height: 55, alignment: .center)
                    .cornerRadius(radius)
                    .padding([.leading, .trailing], 20)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    PlaceholderTextField.init(placeholder: textLabel, text: $textValue)
            } else {
                SecureField("", text: $textValue)
                    .background(Color(Asset.Colors.solitudeGrey.color))
                    .frame(height: 55, alignment: .center)
                    .cornerRadius(radius)
                    .padding([.leading, .trailing], 20)
                    PlaceholderTextField.init(placeholder: textLabel, text: $textValue)
            }
                
        }
    }
}

struct SNSButton: View {
    let action: String
    
    var body: some View {
        Button(action: {
            
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 17)
                    .fill(whichColor())
                    .frame(height: 55)
                
                HStack {
                    if action != "Sign in" {
                        Image(systemName: whichSymbol())
                            .font(.system(size: 20))
                            .foregroundColor(Color.white)
                    }
                    
                    Text(action)
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                }
            }
        })
    }
    
    func whichColor() -> Color {
        if action.contains("Google") {
            return Color.blue
        } else if action.contains("Apple") {
            return Color.black
        } else {
            return Color(Asset.Colors.teal.color)
        }
    }
    
    func whichSymbol() -> String {
        if action.contains("Google") {
            return "g.circle"
        } else if action.contains("Apple") {
            return "applelogo"
        } else {
            return ""
        }
    }
}

struct PlaceholderTextField: View {
    let placeholder: String
    @Binding var text: String
    let internalPadding: CGFloat = 5

    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color.primary.opacity(0.25))
                    .italic()
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing], 20)
            }
        }
    }
}
