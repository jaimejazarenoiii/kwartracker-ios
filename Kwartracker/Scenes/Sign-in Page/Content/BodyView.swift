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
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                
                Text(L10n.Welcome.back)
                    .foregroundColor(Color(Asset.Colors.charcoal.color))
                    .font(.system(size: 45))
                    .fontWeight(.medium)
                    .fixedSize(horizontal: false, vertical: true)
                
                UserField(textLabel: L10n.email, textValue: $email)
                UserField(textLabel: L10n.password, textValue: $password)
                
                SNSButton(text: L10n.Sign.in, action: .signIn).padding(.top, 15)
                
                HStack {
                    Spacer()
                    Text("or")
                        .font(.footnote)
                    Spacer()
                }.padding(.top, 5)
                
                SNSButton(text: L10n.Sign.In.With.google, action: .signInGoogle)
                    .padding(.top, 6)
                
                SNSButton(text: L10n.Sign.In.With.apple, action: .signInApple)
                    .padding(.top, 13)
                
                HStack {
                    Button(action: {
                        
                    }, label: {
                        Text(L10n.Recover.password)
                            .font(.footnote)
                            .foregroundColor(Color(Asset.Colors.spindleGrey.color))
                            .underline()
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Text(L10n.Sign.In.As.guest)
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
                    
                    Text(L10n.No.Account.yet)
                        .font(.footnote)
                    
                    Button(action: {
                        
                    }, label: {
                        Text(L10n.Sign.up)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(Color(Asset.Colors.teal.color))
                            .underline()
                    })
                    
                    Spacer()
                }.padding([.top, .bottom], 20)
            }
            .padding([.leading, .trailing], 30)
            .padding(.top, 70)
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
