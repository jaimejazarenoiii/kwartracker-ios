//
//  FieldType.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/19/21.
//

import Foundation

enum FieldType {
   case email
   case address
   case password
   case lastName
   case firstName
   case birthDate
   case newPassword
   case contactNumber
   case confirmNewPassword
   
   var placeholder: String {
       switch self {
       case .email:
           return L10n.SignInPage.Field.enterEmailAddress
       case .password:
           return L10n.SignInPage.Field.enterPassword
       case .newPassword:
           return L10n.ChangePasswordPage.NewPassword.placeholder
       case .confirmNewPassword:
           return L10n.ChangePasswordPage.ConfirmNewPassword.placeholder
       case .address:
           return L10n.EditProfilePage.Label.address
       case .lastName:
           return L10n.EditProfilePage.Label.lastName
       case .firstName:
           return L10n.EditProfilePage.Label.firstName
       case .birthDate:
           return L10n.EditProfilePage.Label.birthdate
       case .contactNumber:
           return L10n.EditProfilePage.Label.contactNumber
       }
   }
}
