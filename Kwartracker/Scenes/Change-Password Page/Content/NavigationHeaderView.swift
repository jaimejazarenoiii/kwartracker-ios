//
//  NavigationHeaderView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 4/15/21.
//

import SwiftUI

struct NavigationHeaderView: View {
    @State var navigationTitle: String

    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Button(action: {}, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .background(
                            RoundedCorner(radius: 50)
                                .foregroundColor(Color("Teal"))
                                .font(.system(size: 15))
                                .frame(width: 35, height: 35, alignment: .center)
                                .shadow(color: Color.white.opacity(0.3), radius: 3, x: -8, y: -5)
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 8, y: 5)
                        )
                })
                .padding(.trailing, 20)
                
            
                Text(navigationTitle)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Button(action: {}, label: {
                    Text("Save")
                        .fontWeight(.bold)
                        .foregroundColor(.white).opacity(0.3)
                })
            }
        }
        .padding([.leading, .trailing], 30)
        .padding(.top, 10)
        .padding(.bottom, 10)
    }
}

struct NavigationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationHeaderView(navigationTitle: "Change Password")
            .background(Color("Teal"))
    }
}
