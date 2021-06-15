//
//  SignInViewModel.swift
//  Kwartracker
//
//  Created by John Ellie Go on 6/9/21.
//

import SwiftUI
import Apollo

final class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isAuthenticated: Bool = false
    
    var userInfo: SignInMutation.Data.SignInWithEmail?
    
    func doUserLogin() {
        let loginCredentials = CredentialsInput(email: email, password: password)
        let mutation = SignInMutation(signInCredential: loginCredentials)
        
        Network.shared.apollo.perform(mutation: mutation) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let graphQLResult):
                print("Success! Result: \(graphQLResult)")
                self.userInfo = graphQLResult.data?.signInWithEmail
                self.isAuthenticated = true
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
}
