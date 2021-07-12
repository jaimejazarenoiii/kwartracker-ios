//
//  WalletViewState.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 5/14/21.
//

import SwiftUI
import Combine

struct WalletViewState {
    var wallets: [Wallet] = [Wallet]()
    var requestState: APIRequestState = .notStarted
    var walletErrorMessage: String = ""
}

func walletReducer(
    state: inout WalletViewState,
    action: WalletViewActions,
    environment: World
) -> AnyPublisher<WalletViewActions, Never> {
    switch action {
    case .fetch:
        if !state.requestState.isRequesting {
            state.requestState = .requesting
            return environment.walletService.fetch()
                .subscribe(on: DispatchQueue.main)
                .map { WalletViewActions.append(wallets: $0) }
                .catch { Just(WalletViewActions.error(error: $0.localizedDescription)) }
                .eraseToAnyPublisher()
        }
        break
    case .add(let wallet):
        if !state.requestState.isRequesting {
            state.requestState = .requesting
            return environment.walletService.addWallet(wallet: wallet)
                .subscribe(on: DispatchQueue.main)
                .map { WalletViewActions.append(wallets: [$0]) }
                .catch { Just(WalletViewActions.error(error: $0.localizedDescription)) }
                .eraseToAnyPublisher()
        }
        break
    case .edit(let wallet):
        if !state.requestState.isRequesting {
            state.requestState = .requesting
            return environment.walletService.editWallet(wallet: wallet)
                .subscribe(on: DispatchQueue.main)
                .map { WalletViewActions.update(wallet: $0) }
                .catch { Just(WalletViewActions.error(error: $0.localizedDescription)) }
                .eraseToAnyPublisher()
        }
        break
    case .delete( _):
        break
    case .append(wallets: let wallets):
        state.wallets.append(contentsOf: wallets)
        state.requestState = .success
        break
    case .update(let wallet):
        if let row = state.wallets.firstIndex(where: {$0.id == wallet.id}) {
            state.wallets[row] = wallet
        }
        state.requestState = .success
        break
    case .error(let error):
        state.requestState = .finished
        state.walletErrorMessage = error
        break
    }
    return Empty().eraseToAnyPublisher()
}

    extension WalletViewState {
        static let sampleWallets: [Wallet] = [
            Wallet(id: 1,
                   title: "Security Bank",
                   type: WalletType.savings,
                   currency: .philippinePeso,
                   targetRawDate: ""),
            Wallet(id: 2,
                   title: "France Trip",
                   type: WalletType.goal,
                   currency: .philippinePeso,
                   targetAmount: 100_000,
                   targetRawDate: "2025-06-30"),
            Wallet(id: 3,
                   title: "Samgyupsal",
                   type: WalletType.budget,
                   currency: .philippinePeso,
                   targetRawDate: ""),
            Wallet(id: 4,
                   title: "Ramen",
                   type: WalletType.budget,
                   currency: .philippinePeso,
                   targetRawDate: "")
        ]

        static let unitTestList = sampleWallets
    }
