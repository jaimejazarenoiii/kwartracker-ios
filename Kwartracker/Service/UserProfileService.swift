//
//  UserProfileService.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 6/22/21.
//

import Apollo
import Combine
import CocoaLumberjackSwift
import RealmSwift

protocol UserProfileServiceDelegate {
    func getProfile() -> AnyPublisher<FetchProfileQuery.Data, Error>
    func updateProfile(input: UpdateProfileInput) -> AnyPublisher<UserProfile?, Error>
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
                    if let profile = response.data?.profile,
                       let profileId = Int(profile.id) {
                        let genderRaw = Int(profile.gender ?? "") ?? 0
                        let gender = Gender(rawValue: genderRaw) ?? .male
                        let userProfile = UserProfile(id: profileId,
                                                      email: profile.email,
                                                      firstName: profile.firstName,
                                                      middleName: profile.middleName,
                                                      lastName: profile.lastName,
                                                      age: profile.age,
                                                      gender: gender)
                        UserDefaults.standard.storeUserProfile(userProfile: userProfile)
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

    @discardableResult
    func updateProfile(input: UpdateProfileInput) -> AnyPublisher<UserProfile?, Error> {
        Future<UserProfile?, Error> { promise in
            let profileUpdateMutation = ProfileUpdateMutation(input: input)
            Network.shared.apollo.perform(mutation: profileUpdateMutation) { result in
                do {
                    let errors = try result.get().errors
                    let data = try result.get().data
                    if let errors = errors {
                        DDLogError("[UserProfile] error: \(errors)")
                        let errorMessage = errors.map { $0.description }.joined(separator: "\n")
                        promise(.failure(ApiError.custom(description: errorMessage)))
                    } else {
                        DDLogInfo("[UserProfile] data: \(String(describing: data))")
                        var userProfile: UserProfile?
                        if let mutationData = data?.updateProfile {
                            userProfile = UserProfile(mutation: mutationData)
                            UserDefaults.standard.storeUserProfile(userProfile: userProfile!)
                        }
                        promise(.success(userProfile))
                    }
                } catch let error {
                    promise(.failure(error))
                    DDLogError("[UserProfile] error: \(error)")
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
