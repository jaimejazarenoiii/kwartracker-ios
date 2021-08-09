//
//  TokenAddingInterceptor.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 6/22/21.
//
// Reference: https://www.apollographql.com/docs/ios/tutorial/tutorial-mutations/

import Foundation
import Apollo

class TokenAddingInterceptor: ApolloInterceptor {
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {

        if let data = KeyChain.load(key: KeyChainKeys.loginTokenKey) {
            guard let token = String(data: data, encoding: .utf8) else { return }

            request.addHeader(name: "Authorization", value: token)
        }
                
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
}
