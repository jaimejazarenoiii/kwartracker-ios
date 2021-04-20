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
