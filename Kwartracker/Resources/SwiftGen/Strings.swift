// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum ButtonLabelSign {
    /// Sign In
    internal static let `in` = L10n.tr("Localizable", "button_label_sign.in")
    /// Sign Up
    internal static let up = L10n.tr("Localizable", "button_label_sign.up")
    internal enum In {
      internal enum As {
        /// Sign in as guest
        internal static let guest = L10n.tr("Localizable", "button_label_sign.in.as.guest")
      }
    }
    internal enum Up {
      internal enum With {
        /// Sign up with Apple
        internal static let apple = L10n.tr("Localizable", "button_label_sign.up.with.apple")
        /// Sign up with Google
        internal static let google = L10n.tr("Localizable", "button_label_sign.up.with.google")
      }
    }
  }

  internal enum Label {
    /// Email
    internal static let email = L10n.tr("Localizable", "label.email")
    /// or
    internal static let or = L10n.tr("Localizable", "label.or")
    /// Password
    internal static let password = L10n.tr("Localizable", "label.password")
    internal enum Already {
      internal enum HaveAn {
        /// Already have an account?
        internal static let account = L10n.tr("Localizable", "label.already.haveAn.account")
      }
    }
    internal enum Create {
      /// Create\nAccount
      internal static let account = L10n.tr("Localizable", "label.create.account")
    }
  }

  internal enum Placeholder {
    internal enum Enter {
      /// Enter password
      internal static let password = L10n.tr("Localizable", "placeholder.enter.password")
      internal enum Email {
        /// Enter email address
        internal static let address = L10n.tr("Localizable", "placeholder.enter.email.address")
      }
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
    internal enum Label {
      /// No account yet?
      internal static let noAccountYet = L10n.tr("Localizable", "sign_in_page.label.no_account_yet")
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
