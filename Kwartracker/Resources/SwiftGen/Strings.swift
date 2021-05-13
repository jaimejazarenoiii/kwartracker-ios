// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

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

  internal enum TransactionsPage {
    /// + %@
    internal static func addAmount(_ p1: Any) -> String {
      return L10n.tr("Localizable", "transactions_page.add_amount", String(describing: p1))
    }
    /// - %@
    internal static func deductAmount(_ p1: Any) -> String {
      return L10n.tr("Localizable", "transactions_page.deduct_amount", String(describing: p1))
    }
    /// Transactions
    internal static let titleBar = L10n.tr("Localizable", "transactions_page.title_bar")
    /// Search Transaction
    internal static let transactionSearchPlaceholder = L10n.tr("Localizable", "transactions_page.transaction_search_placeholder")
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
