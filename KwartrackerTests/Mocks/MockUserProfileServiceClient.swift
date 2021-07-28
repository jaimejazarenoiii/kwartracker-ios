//
//  MockUserProfileServiceClient.swift
//  KwartrackerTests
//
//  Created by Mickale Saturre on 6/23/21.
//

import Foundation
import Apollo
import Combine
@testable import Kwartracker

class MockUserProfileServiceClient {
    var shouldErrorRequest = false

    let response = FetchProfileQuery.Data.Profile(
        email: "dummy@dummy.email",
        id: GraphQLID(0101),
        firstName: "John",
        lastName: "Doe",
        age: 18,
        gender: "M"
    )
    
    let errorResponse = """
    {
      "data": {
        "profile": null
      },
      "errors": [
        {
          "message": "The field profile on an object of type Query was hidden due to permissions",
          "locations": [
            {
              "line": 1,
              "column": 22
            }
          ],
          "path": [
            "profile"
          ],
          "status": "unauthorized"
          "code": 401
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

extension MockUserProfileServiceClient: UserProfileServiceDelegate {
    @discardableResult func getProfile() -> AnyPublisher<FetchProfileQuery.Data, Error> {
        Future<FetchProfileQuery.Data, Error> { promise in
            if self.shouldErrorRequest {
                let error = NSError(
                    domain: "",
                    code: 401,
                    userInfo: [NSLocalizedDescriptionKey: "Unable to make request"]
                )
                
                promise(.failure(error))
            } else {
                let data = FetchProfileQuery.Data(profile: self.response)
                promise(.success(data))
            }
        }
        .eraseToAnyPublisher()
    }
}
