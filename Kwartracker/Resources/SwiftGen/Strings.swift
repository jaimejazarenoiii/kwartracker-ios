// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Currency
  internal static let currency = L10n.tr("Localizable", "currency")
  /// View All
  internal static let viewAll = L10n.tr("Localizable", "view_all")

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

  internal enum Button {
    internal enum Label {
      /// Save
      internal static let save = L10n.tr("Localizable", "button.label.save")
    }
  }

  internal enum CalendarPage {
    internal enum Label {
      /// Apply
      internal static let apply = L10n.tr("Localizable", "calendar_page.label.apply")
    }
  }

  internal enum Card {
    internal enum Title {
      /// Available Balance
      internal static let availableBalance = L10n.tr("Localizable", "card.title.available_balance")
      /// Budget
      internal static let budget = L10n.tr("Localizable", "card.title.budget")
      /// Goal
      internal static let goal = L10n.tr("Localizable", "card.title.goal")
      /// Savings
      internal static let savings = L10n.tr("Localizable", "card.title.savings")
    }
  }

  internal enum CategoryDetailPage {
    /// Category Parent
    internal static let categoryParent = L10n.tr("Localizable", "category_detail_page.category_parent")
    /// Category Parent Name
    internal static let categoryParentName = L10n.tr("Localizable", "category_detail_page.category_parent_name")
    /// Category Name
    internal static let navigationTitle = L10n.tr("Localizable", "category_detail_page.navigation_title")
  }

  internal enum CategoryPage {
    /// Search Category
    internal static let searchItemPlaceholder = L10n.tr("Localizable", "category_page.search_item_placeholder")
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

  internal enum EditCategoryPage {
    /// Parent Category Name
    internal static let dummyDataParentCategoryName = L10n.tr("Localizable", "edit_category_page.dummy_data_parent_category_name")
    internal enum ContentText {
      /// Make parent category?
      internal static let makeParentCategory = L10n.tr("Localizable", "edit_category_page.content_text.make_parent_category")
      /// Select Icon
      internal static let selectIcon = L10n.tr("Localizable", "edit_category_page.content_text.select_icon")
      /// Select Parent
      internal static let selectParent = L10n.tr("Localizable", "edit_category_page.content_text.select_parent")
      /// Select Parent Category
      internal static let selectParentCategory = L10n.tr("Localizable", "edit_category_page.content_text.select_parent_category")
      /// NO
      internal static let toggleOff = L10n.tr("Localizable", "edit_category_page.content_text.toggle_off")
      /// YES
      internal static let toggleOn = L10n.tr("Localizable", "edit_category_page.content_text.toggle_on")
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

  internal enum LoginAndSecurityPage {
    internal enum DummyData {
      /// email_email_email@emailemail.com
      internal static let email = L10n.tr("Localizable", "login_and_security_page.dummy_data.email")
      /// ***************
      internal static let password = L10n.tr("Localizable", "login_and_security_page.dummy_data.password")
    }
    internal enum Label {
      /// Email Address
      internal static let email = L10n.tr("Localizable", "login_and_security_page.label.email")
    }
  }

  internal enum MainAlertView {
    /// Email is required.
    internal static let emailIsRequiredMessage = L10n.tr("Localizable", "main_alert_view.email_is_required_message")
    /// Error!
    internal static let errorTitle = L10n.tr("Localizable", "main_alert_view.error_title")
    /// Invalid email format.
    internal static let invalidEmailFormatMessage = L10n.tr("Localizable", "main_alert_view.invalid_email_format_message")
    /// Okay
    internal static let okayActionTitle = L10n.tr("Localizable", "main_alert_view.okay_action_title")
    /// Password is required.
    internal static let passwordIsRequiredMessage = L10n.tr("Localizable", "main_alert_view.password_is_required_message")
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

  internal enum ProfilePage {
    /// 2F ESY Bldg, corner Ma Cristina St and Juana Osmeña St, Cebu City, Cebu, Philippines 6000
    internal static let dummyAddress = L10n.tr("Localizable", "profile_page.dummy_address")
    /// January 01, 1998
    internal static let dummyBirthdate = L10n.tr("Localizable", "profile_page.dummy_birthdate")
    /// Samantha Mae Tagli
    internal static let dummyName = L10n.tr("Localizable", "profile_page.dummy_name")
    /// 09012345678
    internal static let dummyNumber = L10n.tr("Localizable", "profile_page.dummy_number")
    /// My Profile
    internal static let title = L10n.tr("Localizable", "profile_page.title")
    internal enum Label {
      /// Address
      internal static let address = L10n.tr("Localizable", "profile_page.label.address")
      /// Birthdate
      internal static let birthdate = L10n.tr("Localizable", "profile_page.label.birthdate")
      /// Contact Number
      internal static let contactNumber = L10n.tr("Localizable", "profile_page.label.contact_number")
    }
  }

  internal enum SettingsPage {
    /// Settings
    internal static let navigationTitle = L10n.tr("Localizable", "settings_page.navigation_title")
    internal enum NavigationItem {
      /// Categories
      internal static let categories = L10n.tr("Localizable", "settings_page.navigation_item.categories")
      /// Login and Security
      internal static let loginAndSecurity = L10n.tr("Localizable", "settings_page.navigation_item.login_and_security")
    }
  }

  internal enum SideMenu {
    internal enum Label {
      /// Home
      internal static let home = L10n.tr("Localizable", "side_menu.label.home")
      /// Logout
      internal static let logout = L10n.tr("Localizable", "side_menu.label.logout")
      /// My Profile
      internal static let myProfile = L10n.tr("Localizable", "side_menu.label.myProfile")
      /// Reports
      internal static let reports = L10n.tr("Localizable", "side_menu.label.reports")
      /// Settings
      internal static let settings = L10n.tr("Localizable", "side_menu.label.settings")
      /// Transaction
      internal static let transaction = L10n.tr("Localizable", "side_menu.label.transaction")
      /// Wallets
      internal static let wallets = L10n.tr("Localizable", "side_menu.label.wallets")
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

  internal enum TransactionsCreateFormModal {
    /// Default date range
    internal static let title = L10n.tr("Localizable", "transactions_create_form_modal.title")
    internal enum ButtonTitle {
      /// Apply
      internal static let apply = L10n.tr("Localizable", "transactions_create_form_modal.button_title.apply")
    }
    internal enum InputField {
      /// Select category
      internal static let category = L10n.tr("Localizable", "transactions_create_form_modal.input_field.category")
      /// This week
      internal static let dateRange = L10n.tr("Localizable", "transactions_create_form_modal.input_field.date_range")
      /// All wallet
      internal static let walletType = L10n.tr("Localizable", "transactions_create_form_modal.input_field.wallet_type")
    }
    internal enum InputLabel {
      /// Category
      internal static let category = L10n.tr("Localizable", "transactions_create_form_modal.input_label.category")
      /// Date range
      internal static let dateRange = L10n.tr("Localizable", "transactions_create_form_modal.input_label.date_range")
      /// Wallet Type
      internal static let walletType = L10n.tr("Localizable", "transactions_create_form_modal.input_label.wallet_type")
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

  internal enum Wallet {
    internal enum ActionButton {
      /// Add Transaction
      internal static let addTransaction = L10n.tr("Localizable", "wallet.action_button.add_transaction")
      /// Edit Wallet
      internal static let editWallet = L10n.tr("Localizable", "wallet.action_button.edit_wallet")
    }
    internal enum Label {
      /// Amount
      internal static let amount = L10n.tr("Localizable", "wallet.label.amount")
      /// Include in overall total balance?
      internal static let includeOverallTotalBalance = L10n.tr("Localizable", "wallet.label.include_overall_total_balance")
      /// Saved to
      internal static let savedTo = L10n.tr("Localizable", "wallet.label.saved_to")
      /// Target Amount
      internal static let targetAmount = L10n.tr("Localizable", "wallet.label.target_amount")
      /// Target Date
      internal static let targetDate = L10n.tr("Localizable", "wallet.label.target_date")
      /// Wallet Name
      internal static let walletName = L10n.tr("Localizable", "wallet.label.wallet_name")
      /// Wallet Type
      internal static let walletType = L10n.tr("Localizable", "wallet.label.wallet_type")
    }
    internal enum Message {
      /// Wallet does not exist
      internal static let walletNotFound = L10n.tr("Localizable", "wallet.message.wallet_not_found")
    }
    internal enum Placeholder {
      /// Enter wallet name
      internal static let enterWalletName = L10n.tr("Localizable", "wallet.placeholder.enter_wallet_name")
      /// Enter your initial amount
      internal static let enterYourInitialAmount = L10n.tr("Localizable", "wallet.placeholder.enter_your_initial_amount")
      /// Select wallet currency
      internal static let selectWalletCurrency = L10n.tr("Localizable", "wallet.placeholder.select_wallet_currency")
      /// Select wallet type
      internal static let selectWalletType = L10n.tr("Localizable", "wallet.placeholder.select_wallet_type")
      /// DD / MM / YYYY
      internal static let targetDate = L10n.tr("Localizable", "wallet.placeholder.target_date")
    }
    internal enum Target {
      /// to target amount
      internal static let toTargetAmount = L10n.tr("Localizable", "wallet.target.to_target_amount")
      /// to target date
      internal static let toTargetDate = L10n.tr("Localizable", "wallet.target.to_target_date")
    }
    internal enum Title {
      /// Add Wallet
      internal static let addWallet = L10n.tr("Localizable", "wallet.title.add_wallet")
      /// My Wallets
      internal static let myWallet = L10n.tr("Localizable", "wallet.title.my_wallet")
    }
  }

  internal enum WalletType {
    /// Budget
    internal static let budget = L10n.tr("Localizable", "wallet_type.budget")
    /// Goal
    internal static let goal = L10n.tr("Localizable", "wallet_type.goal")
    /// Savings
    internal static let savings = L10n.tr("Localizable", "wallet_type.savings")
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
