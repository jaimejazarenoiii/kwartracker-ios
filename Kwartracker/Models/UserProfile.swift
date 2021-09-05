//
//  UserProfile.swift
//  Kwartracker
//
//  Created by Jacob on 9/5/21.
//

struct UserProfile: Codable {
    var id: Int = 0
    var email: String = ""
    var firstName: String = ""
    var middleName: String?
    var lastName: String = ""
    var age: Int? = nil
    var gender: Gender

    enum CodingKeys: String, CodingKey {
        case id, email, firstName,
             middleName, lastName, age, gender
    }

    var fullName: String {
        "\(firstName) \(middleName ?? "") \(lastName)"
    }

    var isEmailValid: Bool {
        Validator.isValidEmail(email: email)
    }

    var saveValidationErrorMessage: String? {
        if email.isEmpty, firstName.isEmpty, lastName.isEmpty {
            return "Do not leave empty on required fields."
        } else if firstName.isEmpty {
            return "Firstname is required."
        } else if lastName.isEmpty {
            return "Lastname is required."
        } else if email.isEmpty {
            return "Email is required."
        } else if !email.isEmpty, !isEmailValid {
            return "Email is invalid."
        } else {
            return nil
        }
    }

    var convertToUpdateProfileInput: UpdateProfileInput {
        UpdateProfileInput(firstName: firstName,
                           middleName: middleName,
                           lastName: lastName,
                           gender: gender.rawValue,
                           age: age ?? 18)
    }
}

extension UserProfile {
    init(mutation: ProfileUpdateMutation.Data.UpdateProfile) {
        id = Int(mutation.id) ?? 0
        email = mutation.email
        firstName = mutation.firstName
        middleName = mutation.middleName
        lastName = mutation.lastName
        age = mutation.age
        gender = Gender(rawValue: Int(mutation.gender ?? "") ?? 0) ?? .male
    }
}
