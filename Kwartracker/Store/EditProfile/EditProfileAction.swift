//
//  EditProfileAction.swift
//  Kwartracker
//
//  Created by Jacob on 9/5/21.
//

enum EditProfileAction {
    case submit(input: UserProfile)
    case success(response: UserProfile?)
    case failed(error: Error)
    case clearErrorMessage
}
