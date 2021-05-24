// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Colors {
    internal static let blueberry = ColorAsset(name: "Blueberry")
    internal static let charcoal = ColorAsset(name: "Charcoal")
    internal static let mintGreen = ColorAsset(name: "MintGreen")
    internal static let nightRider = ColorAsset(name: "NightRider")
    internal static let persianGreen = ColorAsset(name: "PersianGreen")
    internal static let romanRed = ColorAsset(name: "RomanRed")
    internal static let solitudeGrey = ColorAsset(name: "SolitudeGrey")
    internal static let spindleGrey = ColorAsset(name: "SpindleGrey")
    internal static let teal = ColorAsset(name: "Teal")
    internal static let turquoise = ColorAsset(name: "Turquoise")
    internal static let whiteOpacity = ColorAsset(name: "WhiteOpacity")
  }
  internal enum Images {
    internal static let addIcon = ImageAsset(name: "AddIcon")
    internal static let appleIcon = ImageAsset(name: "AppleIcon")
    internal static let arrowLeftIcon = ImageAsset(name: "ArrowLeftIcon")
    internal static let arrowRightIcon = ImageAsset(name: "ArrowRightIcon")
    internal static let calendarIcon = ImageAsset(name: "CalendarIcon")
    internal static let chartIcon = ImageAsset(name: "ChartIcon")
    internal static let checkIcon = ImageAsset(name: "CheckIcon")
    internal static let closeIcon = ImageAsset(name: "CloseIcon")
    internal static let dropDownIcon = ImageAsset(name: "DropDownIcon")
    internal static let editIcon = ImageAsset(name: "EditIcon")
    internal static let filterIcon = ImageAsset(name: "FilterIcon")
    internal static let googleIcon = ImageAsset(name: "GoogleIcon")
    internal static let headerLogoIcon = ImageAsset(name: "HeaderLogoIcon")
    internal static let homeIcon = ImageAsset(name: "HomeIcon")
    internal static let menuIcon = ImageAsset(name: "MenuIcon")
    internal static let powerIcon = ImageAsset(name: "PowerIcon")
    internal static let profileIcon = ImageAsset(name: "ProfileIcon")
    internal static let reportIcon = ImageAsset(name: "ReportIcon")
    internal static let salaryIcon = ImageAsset(name: "SalaryIcon")
    internal static let settingsIcon = ImageAsset(name: "SettingsIcon")
    internal static let transactionIcon = ImageAsset(name: "TransactionIcon")
    internal static let trashIcon2 = ImageAsset(name: "TrashIcon-2")
    internal static let trashIcon = ImageAsset(name: "TrashIcon")
    internal static let walletIcon = ImageAsset(name: "WalletIcon")
    internal static let sampleImage = ImageAsset(name: "sampleImage")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
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
