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
                .foregroundColor(Color(Asset.Colors.charcoal.color))
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
                    .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                    .underline()
                
                Spacer()
                
                Text("Sign in as guest")
                    .font(.footnote)
                    .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                    .underline()
            }.padding(.top, 20)
            
            Spacer()
        }
        .padding([.leading, .trailing], 30)
        .padding(.top, 70)
    }
}

// MARK: - UserField View
struct UserField: View {
    let textLabel: String
    @Binding var textValue: String
    
    var body: some View {
        Text(textLabel)
            .font(.footnote)
            .foregroundColor(Color(Asset.Colors.spindleGrey.color))
            .padding(.top)
        
        ZStack {
            let shadowRadius: CGFloat = 8
            let radius: CGFloat = 17
            
            RoundedRectangle(cornerRadius: radius)
                .fill(Color(Asset.Colors.solitudeGrey.color))
                .frame(height: 48, alignment: .center)
                .cornerRadius(17)
                .shadow(color: Color.white.opacity(1), radius: shadowRadius, x: -6, y: -6)
                .shadow(color: Color.black.opacity(0.15), radius: shadowRadius, x: 7, y: 7)
            
            if textLabel == "Email" {
                TextField("Enter email address", text: $textValue)
                    .background(Color(Asset.Colors.solitudeGrey.color))
                    .frame(height: 48, alignment: .center)
                    .cornerRadius(radius)
                    .padding([.leading, .trailing], 20)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
            } else {
                SecureField("Enter password", text: $textValue)
                    .background(Color(Asset.Colors.solitudeGrey.color))
                    .frame(height: 48, alignment: .center)
                    .cornerRadius(radius)
                    .padding([.leading, .trailing], 20)
            }
                
        }
    }
}

// MARK: - SNS Button View
struct SNSButton: View {
    let action: String
    
    var body: some View {
        Button(action: {
            
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 17)
                    .fill(getColor())
                    .frame(height: 48)
                    .shadow(color: Color.white.opacity(1), radius: 8, x: -6, y: -6)
                    .shadow(color: Color.black.opacity(0.15), radius: 8, x: 7, y: 7)
                
                HStack {
                    if action != "Sign in" {
                        Image(action.contains("Google") ? Asset.Images.googleIcon.name : Asset.Images.appleIcon.name)
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
    
    func getColor() -> Color {
        if action.contains("Google") {
            return Color(Asset.Colors.blueberry.color)
        } else if action.contains("Apple") {
            return Color(Asset.Colors.nightRider.color)
        } else {
            return Color(Asset.Colors.teal.color)
        }
    }
}

struct BodyView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView()
            .background(Color(Asset.Colors.solitudeGrey.color))
            .previewLayout(.sizeThatFits)
    }
}
