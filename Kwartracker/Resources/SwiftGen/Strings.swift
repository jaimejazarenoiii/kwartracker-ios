// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum AlertSheet {
    internal enum Body {
      /// Are you sure you want to delete this?
      internal static let areYouSureYouWantToDeleteThis = L10n.tr("Localizable", "alert_sheet.body.are_you_sure_you_want_to_delete_this")
    }
    internal enum Option {
      /// Cancel
      internal static let cancel = L10n.tr("Localizable", "alert_sheet.option.cancel")
      /// Delete
      internal static let delete = L10n.tr("Localizable", "alert_sheet.option.delete")
    }
    internal enum Title {
      /// Confirmation
      internal static let confirmation = L10n.tr("Localizable", "alert_sheet.title.confirmation")
    }
  }

  internal enum ChangePasswordPage {
    /// Change Password
    internal static let navigationTitle = L10n.tr("Localizable", "change_password_page.navigation_title")
    internal enum ConfirmNewPassword {
      /// Confirm new password
      internal static let label = L10n.tr("Localizable", "change_password_page.confirm_new_password.label")
      /// Enter again new password
      internal static let placeholder = L10n.tr("Localizable", "change_password_page.confirm_new_password.placeholder")
    }
    internal enum NavigationButtonItem {
      /// Save
      internal static let save = L10n.tr("Localizable", "change_password_page.navigation_button_item.save")
    }
    internal enum NewPassword {
      /// New password
      internal static let label = L10n.tr("Localizable", "change_password_page.new_password.label")
      /// Enter new password
      internal static let placeholder = L10n.tr("Localizable", "change_password_page.new_password.placeholder")
    }
  }

  internal enum EditProfilePage {
    /// My Profile
    internal static let navigationTitle = L10n.tr("Localizable", "edit_profile_page.navigation_title")
    internal enum Button {
      /// Change photo
      internal static let changePhoto = L10n.tr("Localizable", "edit_profile_page.button.change_photo")
    }
    internal enum Label {
      /// Address
      internal static let address = L10n.tr("Localizable", "edit_profile_page.label.address")
      /// Birthdate
      internal static let birthdate = L10n.tr("Localizable", "edit_profile_page.label.birthdate")
      /// Contact number
      internal static let contactNumber = L10n.tr("Localizable", "edit_profile_page.label.contact_number")
      /// First name
      internal static let firstName = L10n.tr("Localizable", "edit_profile_page.label.first_name")
      /// Last name
      internal static let lastName = L10n.tr("Localizable", "edit_profile_page.label.last_name")
    }
    internal enum NavigationButtonItem {
      /// Save
      internal static let save = L10n.tr("Localizable", "edit_profile_page.navigation_button_item.save")
    }
  }

  internal enum PopUpConfirmationModal {
    internal enum Button {
      /// Cancel
      internal static let cancel = L10n.tr("Localizable", "pop_up_confirmation_modal.button.cancel")
      /// Delete
      internal static let delete = L10n.tr("Localizable", "pop_up_confirmation_modal.button.delete")
      /// Exit
      internal static let exit = L10n.tr("Localizable", "pop_up_confirmation_modal.button.exit")
      /// Success
      internal static let success = L10n.tr("Localizable", "pop_up_confirmation_modal.button.success")
    }
    internal enum Label {
      internal enum Message {
        /// Are you sure you want to delete this?
        internal static let confirmation = L10n.tr("Localizable", "pop_up_confirmation_modal.label.message.confirmation")
        /// It has been successfully deleted.
        internal static let delete = L10n.tr("Localizable", "pop_up_confirmation_modal.label.message.delete")
        /// New category has been added.
        internal static let success = L10n.tr("Localizable", "pop_up_confirmation_modal.label.message.success")
      }
    }
    internal enum Title {
      /// Confirmation
      internal static let confirmation = L10n.tr("Localizable", "pop_up_confirmation_modal.title.confirmation")
      /// Deleted
      internal static let delete = L10n.tr("Localizable", "pop_up_confirmation_modal.title.delete")
      /// Success
      internal static let success = L10n.tr("Localizable", "pop_up_confirmation_modal.title.success")
    }
  }

  internal enum SignInPage {
    internal enum Button {
      /// Recover password
      internal static let recoverPassword = L10n.tr("Localizable", "sign_in_page.button.recover_password")
      /// Sign In
      internal static let signIn = L10n.tr("Localizable", "sign_in_page.button.sign_in")
      /// Sign in with Apple
      internal static let signInApple = L10n.tr("Localizable", "sign_in_page.button.sign_in_apple")
      /// Sign in with Google
      internal static let signInGoogle = L10n.tr("Localizable", "sign_in_page.button.sign_in_google")
      /// Sign in as guest
      internal static let signInGuest = L10n.tr("Localizable", "sign_in_page.button.sign_in_guest")
      /// Sign Up
      internal static let signUp = L10n.tr("Localizable", "sign_in_page.button.sign_up")
    }
    internal enum Field {
      /// Enter email address
      internal static let enterEmailAddress = L10n.tr("Localizable", "sign_in_page.field.enter_email_address")
      /// Enter password
      internal static let enterPassword = L10n.tr("Localizable", "sign_in_page.field.enter_password")
    }
    internal enum Label {
      /// Email
      internal static let email = L10n.tr("Localizable", "sign_in_page.label.email")
      /// No account yet?
      internal static let noAccountYet = L10n.tr("Localizable", "sign_in_page.label.no_account_yet")
      /// or
      internal static let or = L10n.tr("Localizable", "sign_in_page.label.or")
      /// Password
      internal static let password = L10n.tr("Localizable", "sign_in_page.label.password")
    }
    internal enum Title {
      /// Welcome\nBack
      internal static let welcomeBack = L10n.tr("Localizable", "sign_in_page.title.welcome_back")
    }
  }

  internal enum SignUpPage {
    internal enum Button {
      /// Sign In
      internal static let signIn = L10n.tr("Localizable", "sign_up_page.button.sign_in")
      /// Sign Up
      internal static let signUp = L10n.tr("Localizable", "sign_up_page.button.sign_up")
      /// Sign up with Apple
      internal static let signUpApple = L10n.tr("Localizable", "sign_up_page.button.sign_up_apple")
      /// Sign up with Google
      internal static let signUpGoogle = L10n.tr("Localizable", "sign_up_page.button.sign_up_google")
      /// Sign in as guest
      internal static let signUpGuest = L10n.tr("Localizable", "sign_up_page.button.sign_up_guest")
    }
    internal enum Field {
      /// Enter email address
      internal static let enterEmailAddress = L10n.tr("Localizable", "sign_up_page.field.enter_email_address")
      /// Enter password
      internal static let enterPassword = L10n.tr("Localizable", "sign_up_page.field.enter_password")
    }
    internal enum Label {
      /// Already have an account?
      internal static let alreadyHaveAnAccount = L10n.tr("Localizable", "sign_up_page.label.already_have_an_account")
      /// Email
      internal static let email = L10n.tr("Localizable", "sign_up_page.label.email")
      /// or
      internal static let or = L10n.tr("Localizable", "sign_up_page.label.or")
      /// Password
      internal static let password = L10n.tr("Localizable", "sign_up_page.label.password")
    }
    internal enum Title {
      /// Create\nAccount
      internal static let createAccount = L10n.tr("Localizable", "sign_up_page.title.create_account")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
