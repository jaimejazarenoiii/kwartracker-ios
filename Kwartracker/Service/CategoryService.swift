//
//  CategoryService.swift
//  Kwartracker
//
//  Created by Jacob on 8/7/21.
//

import Combine
import Apollo
import CocoaLumberjackSwift

enum ApiError: Error {
    case custom(description: String)
}

protocol CategoryServiceDelegate {
    func addParentCategory(title: String)
    -> AnyPublisher<AddParentCategoryMutation.Data?, ApiError>
}

struct CategoryService: CategoryServiceDelegate {
    @discardableResult
    func addParentCategory(title: String)
    -> AnyPublisher<AddParentCategoryMutation.Data?, ApiError> {
        Future<AddParentCategoryMutation.Data?, ApiError> { promise in
            let input = AddCategoryGroupInput(title: title)
            DDLogInfo("[CategoryService] add parent category: \(input)")
            Network.shared.apollo
                .perform(mutation: AddParentCategoryMutation(input: input)) { result in
                    do {
                        let errors = try result.get().errors
                        let data = try result.get().data
                        if let errors = errors {
                            DDLogError("[CategoryService] error: \(errors)")
                            let errorMessage = errors.map { $0.description }.joined(separator: "\n")
                            promise(.failure(.custom(description: errorMessage)))
                        } else {
                            DDLogInfo("[CategoryService] data: \(String(describing: data))")
                            promise(.success(data))
                        }
                    } catch let error {
                        let apiError = ApiError.custom(description: error.localizedDescription)
                        DDLogError("[CategoryService] error: \(apiError)")
                        promise(.failure(apiError))
                    }
                }
        }
        .eraseToAnyPublisher()
    }
}
