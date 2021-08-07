//
//  UserProfileService.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 6/22/21.
//

import Apollo
import Combine
import CocoaLumberjackSwift

protocol UserProfileServiceDelegate {
    func getProfile() -> AnyPublisher<FetchProfileQuery.Data, Error>
}

struct UserProfileService: UserProfileServiceDelegate {
    @discardableResult func getProfile() -> AnyPublisher<FetchProfileQuery.Data, Error> {
        Future<FetchProfileQuery.Data, Error> { promise in
            Network.shared.apollo.fetch(
               query: FetchProfileQuery()
            ) { result in
                switch result {
                case .success(let response):
                    if response.data != nil {
                        promise(.success(response.data!))
                    }
                    
                    break
                case .failure(let error):
                    DDLogError("[Fetching Profile] error: \(error)")
                    promise(.failure(error))
                    break
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
