//
//  SignUpViewModel.swift
//  Kwartracker
//
//  Created by John Ellie Go on 6/15/21.
//

import SwiftUI
import Apollo

final class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isAuthenticated: Bool = false
    
    var token: String = ""
    
    func doRegisterUser() {
        let profileInfo = ProfileInput(firstName: "", lastName: "", gender: 0, age: 18)
        let signupCredentials = SignUpWithEmailInput(email: email, password: password,
                                                     passwordConfirmation: password, profile: profileInfo)
        
        let mutation = SignUpMutation(signUpEmailInput: signupCredentials)
        
        Network.shared.apollo.perform(mutation: mutation) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let graphQLResult):
                if let token = graphQLResult.data?.signUpWithEmail?.token {
                    self.token = token
                    self.isAuthenticated = true
                }
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
}
