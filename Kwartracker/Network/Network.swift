//
//  Network.swift
//  Kwartracker
//
//  Created by Jacob on 5/17/21.
//

import Foundation
import Apollo

class Network {
    private static let stagingURL: URL = URL(string: "https://staging-kwartracker.jaimejazarenoiii.me/graphql")!
    static let shared = Network()

    private(set) var apollo: ApolloClient = {
        let client = URLSessionClient()
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let provider = NetworkInterceptorProvider(client: client, store: store)
        let transport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                     endpointURL: stagingURL)
        return ApolloClient(networkTransport: transport, store: store)
    }()

//    private init() {
//        setApolloClientURL(Network.stagingURL)
//    }
//
//    func setApolloClientURL(_ url: URL) {
//        apollo = ApolloClient(url: url)
//    }

    func test() {
        if KeyChainKeys.isLoggedIn() {
            debugPrint("is logged in: \(KeyChainKeys.getLoginKeyChain())")
        } else {
            debugPrint("is not logged in")
        }
    }
}
