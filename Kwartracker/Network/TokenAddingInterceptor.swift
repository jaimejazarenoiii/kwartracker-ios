//
//  TokenAddingInterceptor.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 6/22/21.
//
// Reference: https://www.apollographql.com/docs/ios/tutorial/tutorial-mutations/

import Foundation
import Apollo
import KeychainSwift

class TokenAddingInterceptor: ApolloInterceptor {
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
    
        // let keychain
        let _ = KeychainSwift()
        
        request.addHeader(
            name: "Authorization",
            value: "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIsImlhdCI6MTYyNDQxNTE0MCwiZXhwIjoxNjMyMTkxMTQwfQ.g0lhxdpsxNjRT2ZRVr4keQC-WUwLONbY33WS5yfiwmQ"
        )
        
        /*
         * Actual implementation based on documentation
         if let token = keychain.get(LoginViewController.loginKeychainKey) {
            request.addHeader(name: "Authorization", value: token)
         }
        */
                
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
}
