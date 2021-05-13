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

  internal enum AddTransactionPage {
    /// Add Transaction
    internal static let titleBar = L10n.tr("Localizable", "add_transaction_page.title_bar")
    internal enum Button {
      /// Add
      internal static let add = L10n.tr("Localizable", "add_transaction_page.button.add")
      /// Next
      internal static let next = L10n.tr("Localizable", "add_transaction_page.button.next")
    }
    internal enum FieldInput {
      /// Enter transaction name
      internal static let enterTransactionName = L10n.tr("Localizable", "add_transaction_page.field_input.enter_transaction_name")
      /// Select Category
      internal static let selectCategory = L10n.tr("Localizable", "add_transaction_page.field_input.select_category")
      /// DD / MM / YYYY
      internal static let selectDate = L10n.tr("Localizable", "add_transaction_page.field_input.select_date")
      /// Select transaction type
      internal static let selectTransactionType = L10n.tr("Localizable", "add_transaction_page.field_input.select_transaction_type")
      /// Enter name of person
      internal static let spentWithThisPerson = L10n.tr("Localizable", "add_transaction_page.field_input.spent_with_this_person")
      /// Select wallet to add
      internal static let whichWalletDoYouWantToAdd = L10n.tr("Localizable", "add_transaction_page.field_input.which_wallet_do_you_want_to_add")
    }
    internal enum FieldLabel {
      /// Category
      internal static let categoy = L10n.tr("Localizable", "add_transaction_page.field_label.categoy")
      /// Enter amount
      internal static let enterAmount = L10n.tr("Localizable", "add_transaction_page.field_label.enter_amount")
      /// Select date
      internal static let selectDate = L10n.tr("Localizable", "add_transaction_page.field_label.select_date")
      /// Spent with this person
      internal static let spentWithThisPerson = L10n.tr("Localizable", "add_transaction_page.field_label.spent_with_this_person")
      /// Transaction name
      internal static let transactionName = L10n.tr("Localizable", "add_transaction_page.field_label.transaction_name")
      /// Transaction type
      internal static let transactionType = L10n.tr("Localizable", "add_transaction_page.field_label.transaction_type")
      /// Which wallet do you want it to add?
      internal static let whichWalletDoYouWantToAdd = L10n.tr("Localizable", "add_transaction_page.field_label.which_wallet_do_you_want_to_add")
    }
  }

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

  internal enum TransactionDetailPage {
    /// Transaction
    internal static let titleBar = L10n.tr("Localizable", "transaction_detail_page.title_bar")
    internal enum Label {
      /// Added to wallet
      internal static let addedToWallet = L10n.tr("Localizable", "transaction_detail_page.label.added_to_wallet")
      /// Category
      internal static let category = L10n.tr("Localizable", "transaction_detail_page.label.category")
      /// Spent with
      internal static let spentWith = L10n.tr("Localizable", "transaction_detail_page.label.spent_with")
      /// Transaction date
      internal static let transactionDate = L10n.tr("Localizable", "transaction_detail_page.label.transaction_date")
      /// Transaction type
      internal static let transactionType = L10n.tr("Localizable", "transaction_detail_page.label.transaction_type")
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
