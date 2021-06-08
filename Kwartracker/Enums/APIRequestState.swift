//
//  APIRequestState.swift
//  Kwartracker
//
//  Created by Jacob on 5/7/21.
//

import Foundation

enum APIRequestState {
    case notStarted
    case startRequest
    case successful
    case failed(error: Error)
    case finished
}
