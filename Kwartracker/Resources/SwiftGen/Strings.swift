// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Add New Menu
  internal static let addNewMenu = L10n.tr("Localizable", "Add New Menu")
  /// Example
  internal static let example = L10n.tr("Localizable", "Example")
  /// Menu
  internal static let menu = L10n.tr("Localizable", "Menu")
  /// Menu: Tortang Talong
  internal static let menuTortangTalong = L10n.tr("Localizable", "Menu: Tortang Talong")
  /// New Menu
  internal static let newMenu = L10n.tr("Localizable", "New Menu")
  /// Php
  internal static let php = L10n.tr("Localizable", "Php")
  /// Price: ₱10.00
  internal static let pricePlaceholder = L10n.tr("Localizable", "Price Placeholder")
  /// Test
  internal static let test = L10n.tr("Localizable", "Test")
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
