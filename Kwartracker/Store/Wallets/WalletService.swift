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
    func fetch() -> AnyPublisher<[Wallet], Error>
    func addWallet(wallet: Wallet) -> AnyPublisher<Wallet, Error>
    func editWallet(wallet: Wallet) -> AnyPublisher<Wallet, Error>
}

struct WalletService: WalletServiceDelegate {
    func fetch() -> AnyPublisher<[Wallet], Error> {
        Future<[Wallet], Error> { _ in
        }.eraseToAnyPublisher()
    }
    
    func addWallet(wallet: Wallet) -> AnyPublisher<Wallet, Error> {
        Future<Wallet, Error> { _ in
        }.eraseToAnyPublisher()
    }
    
    func editWallet(wallet: Wallet) -> AnyPublisher<Wallet, Error> {
        Future<Wallet, Error> { _ in
        }.eraseToAnyPublisher()
    }
    
}
