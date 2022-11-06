// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
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
  internal enum Assets {
    internal static let accentColor = ColorAsset(name: "AccentColor")
    internal enum SampleImages {
      internal static let image0001 = ImageAsset(name: "image_0001")
      internal static let image0002 = ImageAsset(name: "image_0002")
      internal static let image0003 = ImageAsset(name: "image_0003")
      internal static let image0004 = ImageAsset(name: "image_0004")
      internal static let image0005 = ImageAsset(name: "image_0005")
    }
  }
  internal enum Colors {
    internal static let primaryGray = ColorAsset(name: "primary_gray")
    internal static let primaryGreen = ColorAsset(name: "primary_green")
  }
  internal enum Images {
    internal static let accommodation = ImageAsset(name: "Accommodation")
    internal static let lunchBox = ImageAsset(name: "Lunch Box")
    internal static let metaverse = ImageAsset(name: "Metaverse")
    internal static let miceTour = ImageAsset(name: "Mice Tour")
    internal static let prayerTime = ImageAsset(name: "Prayer Time")
    internal static let store = ImageAsset(name: "Store")
    internal static let welcomeToHalalKorea = ImageAsset(name: "Welcome to Halal Korea")
    internal static let accomImg = ImageAsset(name: "accom_img")
    internal static let bio = ImageAsset(name: "bio")
    internal static let btnAccommodation = ImageAsset(name: "btn_accommodation")
    internal static let btnLunchBox = ImageAsset(name: "btn_lunchBox")
    internal static let btnMetaverse = ImageAsset(name: "btn_metaverse")
    internal static let btnMiceTour = ImageAsset(name: "btn_miceTour")
    internal static let btnPrayerTime = ImageAsset(name: "btn_prayerTime")
    internal static let btnStore = ImageAsset(name: "btn_store")
    internal static let category1 = ImageAsset(name: "category_1")
    internal static let category1On = ImageAsset(name: "category_1_on")
    internal static let category2 = ImageAsset(name: "category_2")
    internal static let category2On = ImageAsset(name: "category_2_on")
    internal static let category3 = ImageAsset(name: "category_3")
    internal static let category3On = ImageAsset(name: "category_3_on")
    internal static let commonBar = ImageAsset(name: "common_bar")
    internal static let commonChatbot = ImageAsset(name: "common_chatbot")
    internal static let compassImg = ImageAsset(name: "compass_img")
    internal static let cosmetics = ImageAsset(name: "cosmetics")
    internal static let diractionEndMarker = ImageAsset(name: "diraction_end_marker")
    internal static let diractionStartMarker = ImageAsset(name: "diraction_start_marker")
    internal static let fashion = ImageAsset(name: "fashion")
    internal static let food = ImageAsset(name: "food")
    internal static let halalImg3 = ImageAsset(name: "halal_img3")
    internal static let homeHalalLogo = ImageAsset(name: "home_halal_logo")
    internal static let icCheckIn = ImageAsset(name: "ic_check_in")
    internal static let icCheckOut = ImageAsset(name: "ic_check_out")
    internal static let icCheckOut2 = ImageAsset(name: "ic_check_out2")
    internal static let icClosedDate = ImageAsset(name: "ic_closed_date")
    internal static let icCooking = ImageAsset(name: "ic_cooking")
    internal static let icCreditCard = ImageAsset(name: "ic_credit_card")
    internal static let icDet1 = ImageAsset(name: "ic_det_1")
    internal static let icDet2 = ImageAsset(name: "ic_det_2")
    internal static let icDet3 = ImageAsset(name: "ic_det_3")
    internal static let icDet4 = ImageAsset(name: "ic_det_4")
    internal static let icDet5 = ImageAsset(name: "ic_det_5")
    internal static let icDet6 = ImageAsset(name: "ic_det_6")
    internal static let icDet7 = ImageAsset(name: "ic_det_7")
    internal static let icDet8 = ImageAsset(name: "ic_det_8")
    internal static let icDet88 = ImageAsset(name: "ic_det_88")
    internal static let icDet9 = ImageAsset(name: "ic_det_9")
    internal static let icFoodMenu = ImageAsset(name: "ic_food_menu")
    internal static let icInstagram = ImageAsset(name: "ic_instagram")
    internal static let icNaverblog = ImageAsset(name: "ic_naverblog")
    internal static let icRestroom = ImageAsset(name: "ic_restroom")
    internal static let icSaleItem = ImageAsset(name: "ic_sale_item")
    internal static let icSaleTag = ImageAsset(name: "ic_sale_tag")
    internal static let icScaleshopping = ImageAsset(name: "ic_scaleshopping")
    internal static let icShopGuide = ImageAsset(name: "ic_shop_guide")
    internal static let icShopping = ImageAsset(name: "ic_shopping")
    internal static let icViewCount = ImageAsset(name: "ic_view_count")
    internal static let icWelcome = ImageAsset(name: "ic_welcome")
    internal static let icYoutube = ImageAsset(name: "ic_youtube")
    internal static let imgNo = ImageAsset(name: "img_no")
    internal static let lunchImg = ImageAsset(name: "lunch_img")
    internal static let mapMarker = ImageAsset(name: "map_marker")
    internal static let martMarker = ImageAsset(name: "mart_marker")
    internal static let medicines = ImageAsset(name: "medicines")
    internal static let metaImg = ImageAsset(name: "meta_img")
    internal static let miceImg = ImageAsset(name: "mice_img")
    internal static let mosqueMarker = ImageAsset(name: "mosque_marker")
    internal static let prayerImg = ImageAsset(name: "prayer_img")
    internal static let resMarker = ImageAsset(name: "res_marker")
    internal static let splachHalalLogo = ImageAsset(name: "splach_halal_logo")
    internal static let storeImg = ImageAsset(name: "store_img")
    internal static let tabHome = ImageAsset(name: "tab_home")
    internal static let tabKhalal = ImageAsset(name: "tab_khalal")
    internal static let tabLunchBox = ImageAsset(name: "tab_lunchBox")
    internal static let tabQibla = ImageAsset(name: "tab_qibla")
    internal static let visibleOff = ImageAsset(name: "visible_off")
    internal static let visibleOn = ImageAsset(name: "visible_on")
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

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

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

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
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

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
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

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

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
