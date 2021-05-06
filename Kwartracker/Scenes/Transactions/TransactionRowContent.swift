//
//  TransactionRowContent.swift
//  Kwartracker
//
//  Created by Jacob on 4/25/21.
//

import SwiftUI

struct TransactionRowContent: View {
    var transaction: Transaction

    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(Asset.Colors.mysticBlueGrey.color))
                    .frame(width: 40, height: 40)

                VStack {
                    Text(transaction.getMonth())
                        .frame(height: 8)
                        .font(.system(size: 8, weight: .medium))

                    Text(transaction.getDay())
                        .frame(height: 20)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color(Asset.Colors.teal.color))
                }
            }

            Spacer()
                .frame(width: 10)

            VStack(alignment: .leading) {
                HStack {
                    Image(uiImage: Asset.Images.salaryIcon.image)
                    Text(transaction.category.title)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(Color(Asset.Colors.teal.color))
                }
                Text(transaction.title)
                    .font(.system(size: 15))
            }

            Spacer()

            Text(L10n.TransactionsPage.addAmount(transaction.amountCurrencyDisplay))
                .foregroundColor(Color(Asset.Colors.niagaraGreen.color))

            Spacer()
                .frame(width: 15)

            Button(action: {
            }, label: {
                Image(uiImage: Asset.Images.arrowRightIcon.image)
                    .frame(width: 5, height: 5)
            })
            .buttonStyle(CircleButtonStyle(buttonColor: Asset.Colors.solitudeGrey.color, padding: 10))
        }
        .listRowBackground(Color.clear)
        .padding([.top, .bottom], 15)
    }
}
