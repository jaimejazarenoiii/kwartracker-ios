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
    
    private var isFetching = false
    var userInfo: SignInMutation.Data.SignInWithEmail?
    
    func doUserLogin() {
        guard !isFetching else { return }
        isFetching = true
        
        let loginCredentials = CredentialsInput(email: email, password: password)
        let mutation = SignInMutation(signInCredential: loginCredentials)
        
        Network.shared.apollo.perform(mutation: mutation) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.signInWithEmail {
                    self.userInfo = data
                    self.isAuthenticated = true
                }
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
            
            self.isFetching = false
        }
    }
}
