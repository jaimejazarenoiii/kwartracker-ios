//
//  TransactionRow.swift
//  Kwartracker
//
//  Created by Jacob on 4/25/21.
//

import SwiftUI

struct TransactionRow: View {
    var transaction: Transaction

    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color(Asset.Colors.mysticBlueGrey.color))
                    .frame(width: 40, height: 40)

                VStack {
                    Text(transaction.monthDisplay.uppercased())
                        .frame(height: 8)
                        .font(.system(size: 8, weight: .medium))

                    Text(transaction.dayDisplay)
                        .frame(height: 20)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color(Asset.Colors.teal.color))
                }
            }

            Spacer()
                .frame(width: 10)

            VStack(alignment: .leading, spacing: 1) {
                HStack(alignment: .center, spacing: 3) {
                    Image(uiImage: Asset.Images.salaryIcon.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 12)
                    Text(transaction.category.title)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(Color(Asset.Colors.teal.color))
                }
                Text(transaction.title)
                    .font(.system(size: 15))
            }

            Spacer()

            Text(L10n.TransactionsPage.addAmount(transaction.amountCurrencyDisplay))
                .font(.system(size: 15))
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
        .padding([.top, .bottom], 0)
    }
}
