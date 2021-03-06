//
//  World.swift
//  Kwartracker
//
//  Created by Jacob on 3/29/21.
//

import Foundation

// For more information check "How To Control The World" - Stephen Celis
// https://vimeo.com/291588126
struct World {
    var walletService: WalletServiceDelegate = WalletService()
    var authenticationService: AuthenticationServiceDelegate = AuthenticationService()
    var userProfileService: UserProfileServiceDelegate = UserProfileService()
    var categoryService: CategoryServiceDelegate = CategoryService()
}
