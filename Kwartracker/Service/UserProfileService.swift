//
//  UserProfileService.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 6/22/21.
//

import Apollo

protocol UserProfileServiceDelegate {
    func getProfile(
        completion: @escaping (Result<GraphQLResult<FetchProfileQuery.Data>, Error>) -> Void
    ) -> Cancellable
}

struct UserProfileService: UserProfileServiceDelegate {
    @discardableResult func getProfile(
        completion: @escaping (Result<GraphQLResult<FetchProfileQuery.Data>, Error>) -> Void
    ) -> Cancellable {
        Network.shared.apollo.fetch(
            query: FetchProfileQuery(),
            resultHandler: { completion($0) }
        )
    }
}
