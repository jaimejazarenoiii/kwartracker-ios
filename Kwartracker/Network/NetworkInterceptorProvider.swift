//
//  NetworkInterceptorProvider.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 6/22/21.
//
// Reference: https://www.apollographql.com/docs/ios/tutorial/tutorial-mutations/

import Foundation
import Apollo

class NetworkInterceptorProvider: LegacyInterceptorProvider {
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(TokenAddingInterceptor(), at: 0)
        return interceptors
    }
}
