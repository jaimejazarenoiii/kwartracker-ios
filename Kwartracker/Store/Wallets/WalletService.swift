//
//  WalletService.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 7/12/21.
//

import Apollo
import Combine
import SwiftUI


protocol WalletServiceDelegate {
    func fetch() -> AnyPublisher<[Wallet], GraphQLError>
    func addWallet(wallet: Wallet) -> AnyPublisher<Wallet, GraphQLError>
    func editWallet(wallet: Wallet) -> AnyPublisher<Wallet, GraphQLError>
}

struct WalletService: WalletServiceDelegate {
    func fetch() -> AnyPublisher<[Wallet], GraphQLError> {
        Future<[Wallet], GraphQLError> { promise in
            DispatchQueue.main.async {
                Network.shared.apollo.fetch(query: FetchWalletsQuery()) { result in
                    switch result {
                    case .success(let response):
                        guard let data = response.data?.wallets else {
                            if response.errors != nil {
                                let first = response.errors?.first
                                promise(.failure(first!))
                            }
                            return
                        }
                        var wallets = [Wallet]()
                        for wData in data {
                            var transactions = [Transaction]()
                            var wallet = Wallet(id: Int(wData.id) ?? 0,
                                       title: wData.title,
                                       currency: Currency(stringValue: wData.currency))
                            if let tData = wData.transactions {
                                for transaction in tData {
                                    let category = transaction.category
                                    transactions.append(
                                        Transaction(
                                            id: Int(transaction.id) ?? 0,
                                            title: transaction.title ?? "",
                                            category: Category(
                                                id: Int(category?.id ?? "0") ?? 0,
                                                title: category?.title ?? ""),
                                            amount: transaction.amount,
                                            wallet: wallet,
                                            rawDateTime: transaction.datetime)
                                    )
                                }
                            }
                            wallet.transactions = transactions
                            wallets.append(
                                wallet
                            )
                        }
                        promise(.success(wallets))
                        break
                    case .failure(let error):
                        let err = GraphQLError(["message": error.localizedDescription])
                        promise(.failure(err))
                        break
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func addWallet(wallet: Wallet) -> AnyPublisher<Wallet, GraphQLError> {
        return Future<Wallet, GraphQLError> { promise in
            DispatchQueue.main.async {
                let currency = wallet.currency ?? Currency.philippinePeso
                let input = AddWalletInput(
                    title: wallet.title,
                    currency: currency.rawValue.id,
                    amount: wallet.targetAmount)
                Network.shared.apollo
                    .perform(
                        mutation: AddWalletMutation(addWalletInput: input),
                        resultHandler: { result in
                            switch result {
                            case .success(let response):
                                guard let data = response.data?.addWallet else {
                                    if response.errors != nil {
                                        let first = response.errors?.first
                                        promise(.failure(first!))
                                    }
                                    return
                                }
                                var newWallet = Wallet(id: Int(data.id) ?? 0,
                                           title: data.title,
                                           currency: Currency(stringValue: data.currency),
                                           targetRawDate: "")
                                var transactions = [Transaction]()
                                if let tData = data.transactions {
                                    for transaction in tData {
                                        let category = transaction.category
                                        transactions.append(
                                            Transaction(
                                                id: Int(transaction.id) ?? 0,
                                                title: transaction.title ?? "",
                                                category: Category(
                                                    id: Int(category?.id ?? "0") ?? 0,
                                                    title: category?.title ?? ""),
                                                amount: transaction.amount,
                                                wallet: newWallet,
                                                rawDateTime: transaction.datetime)
                                        )
                                    }
                                }
                                newWallet.transactions = transactions
                                promise(.success(newWallet))
                                break
                            case .failure(let error):
                                let err = GraphQLError(["message": error.localizedDescription])
                                promise(.failure(err))
                                break
                            }
                        }
                    )
            }
        }
        .eraseToAnyPublisher()
    }
    
    func editWallet(wallet: Wallet) -> AnyPublisher<Wallet, GraphQLError> {
        return Future<Wallet, GraphQLError> { promise in
            DispatchQueue.main.async {
                let input = EditWalletInput(
                    id: "\(wallet.id)",
                    title: wallet.title,
                    currency: 3)
                Network.shared.apollo
                    .perform(
                        mutation: EditWalletMutation(editWalletInput: input),
                        resultHandler: { result in
                            switch result {
                            case .success(let response):
                                guard let data = response.data?.editWallet else {
                                    if response.errors != nil {
                                        let first = response.errors?.first
                                        promise(.failure(first!))
                                    }
                                    return
                                }
                                var editWallet = Wallet(id: Int(data.id) ?? 0,
                                                        title: data.title,
                                                        currency: Currency(stringValue: data.currency),
                                                        targetRawDate: "")
                                var transactions = [Transaction]()
                                if let tData = data.transactions {
                                    for transaction in tData {
                                        let category = transaction.category
                                        transactions.append(
                                            Transaction(
                                                id: Int(transaction.id) ?? 0,
                                                title: transaction.title ?? "",
                                                category: Category(
                                                    id: Int(category?.id ?? "0") ?? 0,
                                                    title: category?.title ?? ""),
                                                amount: transaction.amount,
                                                wallet: editWallet,
                                                rawDateTime: transaction.datetime)
                                        )
                                    }
                                }
                                editWallet.transactions = transactions
                                promise(.success(editWallet))
                                break
                            case .failure(let error):
                                let err = GraphQLError(["message": error.localizedDescription])
                                promise(.failure(err))
                                break
                            }
                        }
                    )
            }
        }
        .eraseToAnyPublisher()
    }
    
}
