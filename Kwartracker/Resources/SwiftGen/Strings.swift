// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Email
  internal static let email = L10n.tr("Localizable", "email")
  /// or
  internal static let or = L10n.tr("Localizable", "or")
  /// Password
  internal static let password = L10n.tr("Localizable", "password")

  internal enum Enter {
    /// Enter password
    internal static let password = L10n.tr("Localizable", "enter.password")
    internal enum Email {
      /// Enter email address
      internal static let address = L10n.tr("Localizable", "enter.email.address")
    }
  }

  internal enum No {
    internal enum Account {
      /// No account yet?
      internal static let yet = L10n.tr("Localizable", "no.account.yet")
    }
  }

  internal enum Recover {
    /// Recover password
    internal static let password = L10n.tr("Localizable", "recover.password")
  }

  internal enum Sign {
    /// Sign In
    internal static let `in` = L10n.tr("Localizable", "sign.in")
    /// Sign Up
    internal static let up = L10n.tr("Localizable", "sign.up")
    internal enum In {
      internal enum As {
        /// Sign in as guest
        internal static let guest = L10n.tr("Localizable", "sign.in.as.guest")
      }
      internal enum With {
        /// Sign in with Apple
        internal static let apple = L10n.tr("Localizable", "sign.in.with.apple")
        /// Sign in with Google
        internal static let google = L10n.tr("Localizable", "sign.in.with.google")
      }
    }
  }

  internal enum Welcome {
    /// Welcome\nBack
    internal static let back = L10n.tr("Localizable", "welcome.back")
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
