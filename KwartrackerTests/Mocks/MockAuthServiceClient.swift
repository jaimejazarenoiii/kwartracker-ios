//
//  MockAuthServiceClient.swift
//  KwartrackerTests
//
//  Created by John Ellie Go on 6/21/21.
//

import Foundation
import Apollo
import Combine
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
    func signIn(credentialInput input: CredentialsInput) -> AnyPublisher<SignInMutation.Data, Error> {
        Future<SignInMutation.Data, Error> { promise in
            if self.shouldErrorRequest {
                let error = NSError(domain: "", code: 422,
                                    userInfo: [
                                        NSLocalizedDescriptionKey: "Unable to make request"
                                    ])
                
                promise(.failure(error))
            } else {
                let data = SignInMutation.Data(signInWithEmail: self.loginResponse)
                promise(.success(data))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func signUp(signUpCredential input: SignUpWithEmailInput) -> AnyPublisher<SignUpMutation.Data, Error> {
        Future<SignUpMutation.Data, Error> { promise in
            if self.shouldErrorRequest {
                let error = NSError(domain: "", code: 422,
                                    userInfo: [NSLocalizedDescriptionKey: "Unable to make request"])
                
                promise(.failure(error))
            } else {
                let data = SignUpMutation.Data(signUpWithEmail: self.registrationResponse)
                promise(.success(data))
            }

        }
        .eraseToAnyPublisher()
    }
}

