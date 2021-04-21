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
    
    private var HeaderText: some View {
        Text(L10n.Welcome.back)
            .foregroundColor(Color(Asset.Colors.nightRider.color))
            .font(.system(size: 45))
            .fontWeight(.medium)
            .fixedSize(horizontal: false, vertical: true)
    }
    
    private var UserFields: some View {
        Group {
            UserField(fieldType: .email, textValue: $email)
            UserField(fieldType: .password, textValue: $password)
        }
    }
    
    private var SNSActions: some View {
        Group {
            SNSButton(actionHandler: {}, actionLabel: .signIn)
                .padding(.top)
            
            HStack {
                Spacer()
                Text(L10n.or)
                    .font(.footnote)
                    .foregroundColor(Color(Asset.Colors.charcoal.color))
                Spacer()
            }.padding(.top, 5)
            
            SNSButton(actionHandler: {}, actionLabel: .signInGoogle)
            
            SNSButton(actionHandler: {}, actionLabel: .signInApple)
                .padding(.top)
        }
    }
    
    private var FootNoteActions: some View {
        Group {
            HStack {
                FootnoteButton(action: {}, text: L10n.Recover.password)
                
                Spacer()
                
                FootnoteButton(action: {}, text: L10n.Sign.In.As.guest)
            }.padding(.top, 25)
            
            Divider()
                .padding([.leading, .trailing], -30)
                .padding(.top, 25)
            
            HStack {
                Spacer()
                
                Text(L10n.No.Account.yet)
                    .font(.footnote)
                    .foregroundColor(Color(Asset.Colors.nightRider.color))
                
                FootnoteButton(action: {}, text: L10n.Sign.up, fontWeight: .bold,
                               color: Color(Asset.Colors.teal.color))
                
                Spacer()
            }.padding([.top, .bottom], 20)
        }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                
                HeaderText
                
                UserFields
                
                SNSActions
                
                FootNoteActions
            }
            .padding([.leading, .trailing], 30)
            .padding(.top, 70)
        }
    }
}

private struct FootnoteButton: View {
    let action: () -> Void
    let text: String
    
    var fontWeight: Font.Weight = .regular
    var color: Color = Color(Asset.Colors.spindleGrey.color)
    
    var body: some View {
        Button(action: {}, label: {
            Text(text)
                .font(.footnote)
                .fontWeight(fontWeight)
                .foregroundColor(color)
                .underline()
        })
    }
}

struct BodyView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView()
            .background(Color(Asset.Colors.solitudeGrey.color))
            .previewLayout(.sizeThatFits)
    }
}
