//
//  MockWalletServiceClient.swift
//  KwartrackerTests
//
//  Created by Leah Joy Ylaya on 8/9/21.
//

import Foundation
import Apollo
import Combine
@testable import Kwartracker

class MockWalletServiceClient {
    var shouldFetchWithError = false
    var shouldAddWithError = false
    var shouldEditWithError = false
    
    let addResponse = AddWalletMutation.Data.AddWallet(
        currency: "php",
        id: GraphQLID(5),
        title: "My BDO")
    
    let editResponse = EditWalletMutation.Data.EditWallet(
        currency: "php",
        id: GraphQLID(6),
        title: "My Bday",
        transactions: [EditWalletMutation.Data.EditWallet.Transaction]())
    
    let fetchResponse = FetchWalletsQuery.Data.init(
        wallets:
            [FetchWalletsQuery.Data.Wallet(currency: "php", id: GraphQLID(1), title: "My BDO"),
             FetchWalletsQuery.Data.Wallet(currency: "php", id: GraphQLID(1), title: "My BDO"),
             FetchWalletsQuery.Data.Wallet(currency: "php", id: GraphQLID(1), title: "My BDO"),
            ]
    )
    let fetchErrorGraphQL = GraphQLError(
        ["message":
            "The field wallets on an object of type Query was hidden due to permissions"]
    )
    let addEditErrorResponse = GraphQLError(["message": "'2' is not a valid currency"])
    
    private func createJSONObject(_ mockObject: String) -> JSONObject? {
        guard let data = mockObject.data(using: .utf8) else { return nil }
        
        do {
            if let jsonObject = try JSONSerialization.jsonObject(
                with: data,
                options: .allowFragments
            ) as? Dictionary<String, Any> {
                return jsonObject
            }
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
        
        return nil
    }
}

extension MockWalletServiceClient: WalletServiceDelegate {
    func fetch() -> AnyPublisher<[Wallet], GraphQLError> {
        Future<[Wallet], GraphQLError> { [weak self] promise in
            guard let self = self else { return }
            if !self.shouldFetchWithError {
                guard let data = self.fetchResponse.wallets else { return }
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
                
            } else {
                promise(.failure(self.fetchErrorGraphQL))
                
            }
        }
        .eraseToAnyPublisher()
    }
    
    func addWallet(wallet: Wallet) -> AnyPublisher<Wallet, GraphQLError> {
        return Future<Wallet, GraphQLError> { [weak self] promise in
            guard let self = self else { return }
            if !self.shouldAddWithError {
                let data = self.addResponse
                let newWallet = Wallet(id: Int(data.id) ?? 0,
                           title: data.title,
                           currency: Currency(stringValue: data.currency),
                           targetRawDate: "")
                promise(.success(newWallet))
            } else {
                promise(.failure(self.addEditErrorResponse))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func editWallet(wallet: Wallet) -> AnyPublisher<Wallet, GraphQLError> {
        return Future<Wallet, GraphQLError> { [weak self] promise in
            guard let self = self else { return }
            if !self.shouldEditWithError {
                let data = self.editResponse
                let newWallet = Wallet(id: Int(data.id) ?? 0,
                           title: data.title,
                           currency: Currency(stringValue: data.currency),
                           targetRawDate: "")
                promise(.success(newWallet))
            } else {
                promise(.failure(self.addEditErrorResponse))
            }
        }
        .eraseToAnyPublisher()
    }
}
