import SwiftUI

public extension Font {
    /// Returns a clamped system font
    /// - Parameters:
    ///   - sizeCategory: use `@Environment(\.dynamicTypeSize) var dynamicTypeSize` at the call site
    ///   - factor: The scale factor in which to increase in size. Defaults is 2.0,  increase for a larger font sooner in the ``DynamicTypeSize``
    ///   - size: The minimum size of the font. Defaults to 16
    ///   - weight: The font weight
    /// - Returns: A dynamicly scaled system font
    static func clampedFont(
        for sizeCategory: DynamicTypeSize,
        size: CGFloat = 16,
        factor: CGFloat = 2.0,
        weight: Font.Weight = .regular
    ) -> Font {
        let maxSize = size * factor
        return .system(
            size: min(size * sizeCategory.dynamicFontScaleFactor(), maxSize),
            weight: weight
        )
    }
}

private extension DynamicTypeSize {
    func dynamicFontScaleFactor() -> CGFloat {
        switch self {
        case .xSmall:
            return 0.8
        case .small:
            return 0.9
        case .medium:
            return 1.0
        case .large:
            return 1.1
        case .xLarge:
            return 1.2
        case .xxLarge:
            return 1.3
        case .xxxLarge:
            return 1.4
        case .accessibility1:
            return 1.5
        case .accessibility2:
            return 1.6
        case .accessibility3:
            return 1.7
        case .accessibility4:
            return 1.8
        case .accessibility5:
            return 1.9
        default:
            return 1.0
        }
    }
}
