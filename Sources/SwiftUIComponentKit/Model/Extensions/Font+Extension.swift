import SwiftUI

public extension Font {
    /// Returns a clammped system font
    /// - Parameters:
    ///   - sizeCategory: use `@Environment(\.sizeCategory) var sizeCategory` at the call site
    static func clampedFont(
        for sizeCategory: ContentSizeCategory,
        minSize: CGFloat = 16,
        maxSize: CGFloat = 20,
        weight: Font.Weight = .regular
    ) -> Font {
        .system(
            size: min(minSize * sizeCategory.dynamicFontScaleFactor(), maxSize),
            weight: weight
        )
    }
}
public extension ContentSizeCategory {
    func dynamicFontScaleFactor() -> CGFloat {
        switch self {
        case .extraSmall:
            return 0.8
        case .small:
            return 0.9
        case .medium:
            return 1.0
        case .large:
            return 1.1
        case .extraLarge:
            return 1.3
        case .extraExtraLarge:
            return 1.5
        case .accessibilityExtraLarge:
            return 2.0
        default:
            return 1.5
        }
    }
}
