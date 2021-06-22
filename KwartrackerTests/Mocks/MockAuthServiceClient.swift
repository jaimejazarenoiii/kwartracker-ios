//
//  MockAuthServiceClient.swift
//  KwartrackerTests
//
//  Created by John Ellie Go on 6/21/21.
//

import Foundation
import Apollo
@testable import Kwartracker

class MockAuthServiceClient {
    var shouldErrorRequest = false
    var shouldLoginWithError = false
    var shouldSignupWithError = false
    
    let loginResponse = SignInMutation.Data.SignInWithEmail(
        token: "sampleToken",
        user: SignInMutation.Data.SignInWithEmail.User(
            id: GraphQLID(0101),
            email: "test@test.com",
            firstName: "John",
            lastName: "Test",
            gender: "M",
            age: 18
        )
    )
    
    let registrationResponse = SignUpMutation.Data.SignUpWithEmail(token: "sampleToken")
    
    let loginErrorResponse = """
        {
          "data": {
            "signInWithEmail": null
          },
          "errors": [
            {
              "message": "Record not found",
              "locations": [
                {
                  "line": 2,
                  "column": 5
                }
              ],
              "path": [
                "signInWithEmail"
              ],
              "status": "unprocessable_entity",
              "code": 422
            }
          ]
        }
        """
    
    let signupErrorResponse = """
        {
          "data": {
            "signUpWithEmail": null
          },
          "errors": [
            {
              "message": "Email has already been taken",
              "locations": [
                {
                  "line": 2,
                  "column": 5
                }
              ],
              "path": [
                "signUpWithEmail"
              ],
              "status": "unprocessable_entity",
              "code": 422
            }
          ]
        }
        """
    
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

extension MockAuthServiceClient: AuthenticationServiceDelegate {
    @discardableResult func signIn(
        credentialInput input: CredentialsInput,
        completion: @escaping (Result<GraphQLResult<SignInMutation.Data>, Error>) -> Void
    ) -> Cancellable {
        if shouldErrorRequest {
            let error = NSError(domain: "", code: 422,
                                userInfo: [NSLocalizedDescriptionKey: "Unable to make request"])
            
            completion(.failure(error))
        } else {
            if shouldLoginWithError {
                if let errorJSONObject = createJSONObject(loginErrorResponse) {
                    let error = GraphQLError(errorJSONObject)
                    
                    completion(.success(GraphQLResult<SignInMutation.Data>(
                        data: nil,
                        extensions: nil,
                        errors: [error],
                        source: .server,
                        dependentKeys: Set<CacheKey>(arrayLiteral: CacheKey(0))
                    )))
                }
            } else {
                let data = SignInMutation.Data(signInWithEmail: loginResponse)
                
                completion(.success(GraphQLResult<SignInMutation.Data>(
                    data: data,
                    extensions: nil,
                    errors: nil,
                    source: .server,
                    dependentKeys: nil
                )))
            }
        }
        
        return MockServiceTransport()
    }
    
    func signUp(
        signUpCredential input: SignUpWithEmailInput,
        completion: @escaping (Result<GraphQLResult<SignUpMutation.Data>, Error>) -> Void
    ) -> Cancellable {
        if shouldErrorRequest {
            let error = NSError(domain: "", code: 422,
                                userInfo: [NSLocalizedDescriptionKey: "Unable to make request"])
            
            completion(.failure(error))
        } else {
            if shouldSignupWithError {
                if let errorJSONObject = createJSONObject(signupErrorResponse) {
                    let error = GraphQLError(errorJSONObject)
                    
                    completion(.success(GraphQLResult<SignUpMutation.Data>(
                        data: nil,
                        extensions: nil,
                        errors: [error],
                        source: .server,
                        dependentKeys: nil
                    )))
                }
            } else {
                let data = SignUpMutation.Data(signUpWithEmail: registrationResponse)
                
                completion(.success(GraphQLResult<SignUpMutation.Data>(
                    data: data,
                    extensions: nil,
                    errors: nil,
                    source: .server,
                    dependentKeys: nil
                )))
            }
        }
        
        return MockServiceTransport()
    }
}

class MockServiceTransport: Cancellable {
    func cancel() {
        
    }
}
