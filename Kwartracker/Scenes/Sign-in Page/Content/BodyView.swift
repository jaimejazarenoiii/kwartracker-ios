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
                Button(action: {
                    
                }, label: {
                    Text("Recover password")
                        .font(.footnote)
                        .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                        .underline()
                })
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("Sign in as guest")
                        .font(.footnote)
                        .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                        .underline()
                })
            }.padding(.top, 25)
            
            Divider()
                .padding([.leading, .trailing], -30)
                .padding(.top, 25)
            
            HStack {
                Spacer()
                
                Text("No account yet?")
                    .font(.footnote)
                
                Button(action: {
                    
                }, label: {
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Teal"))
                        .underline()
                })
                
                Spacer()
            }.padding([.top, .bottom], 27)
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
