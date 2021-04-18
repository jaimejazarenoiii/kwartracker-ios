//
//  TransactionsView.swift
//  Kwartracker
//
//  Created by Jacob on 4/16/21.
//

import SwiftUI

struct TransactionsView: View {
    var body: some View {
        ZStack {
            Color(Asset.Colors.teal.color)
                .ignoresSafeArea(.all)

            VStack {
                
                HStack {
                    Spacer()
                        .frame(width: 30)

                    Button(action: {
                        debugPrint("Button tapped!")
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                    }
                    .buttonStyle(
                        CircleButtonStyle(buttonColor: Asset.Colors.teal.color)
                    )

                    Spacer()

                    Text("Transaction")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(.title2)

                    Spacer()

                    Button(action: {
                        debugPrint("Button tapped!")
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color(Asset.Colors.teal.color))
                    })
                    .buttonStyle(CircleButtonStyle(buttonColor: .white))

                    Spacer()
                        .frame(width: 30)
                }

                Spacer()
            }
        }
    }
}

struct SampleMainView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView()
    }
}
