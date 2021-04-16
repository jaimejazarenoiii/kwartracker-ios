// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Already have an account?
  internal static let alreadyHaveAnAccount = L10n.tr("Localizable", "alreadyHaveAnAccount")
  /// Create\nAccount
  internal static let createAccount = L10n.tr("Localizable", "createAccount")
  /// Email
  internal static let email = L10n.tr("Localizable", "email")
  /// Enter email address
  internal static let enterEmailAddress = L10n.tr("Localizable", "enterEmailAddress")
  /// Enter password
  internal static let enterPassword = L10n.tr("Localizable", "enterPassword")
  /// or
  internal static let or = L10n.tr("Localizable", "or")
  /// Password
  internal static let password = L10n.tr("Localizable", "password")
  /// Sign In
  internal static let signIn = L10n.tr("Localizable", "signIn")
  /// Sign in as guest
  internal static let signInAsGuest = L10n.tr("Localizable", "signInAsGuest")
  /// Sign Up
  internal static let signUp = L10n.tr("Localizable", "signUp")
  /// Sign up with Apple
  internal static let signUpWithApple = L10n.tr("Localizable", "signUpWithApple")
  /// Sign up with Google
  internal static let signUpWithGoogle = L10n.tr("Localizable", "signUpWithGoogle")
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
