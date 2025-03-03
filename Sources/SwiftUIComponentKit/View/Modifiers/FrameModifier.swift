import SwiftUI

/// Adds a frame to a View based on the ``DisplayType``
///
/// vertical = height
///
/// Horizontal = width
struct FrameModifier: ViewModifier {
    var displayType: DisplayType
    var size: CGFloat
    
    func body(
        content: Content
    ) -> some View {
        switch displayType {
        case .vertical:
            content.frame(height: size)
        case .horizontal:
            content.frame(width: size)
        }
    }
}
