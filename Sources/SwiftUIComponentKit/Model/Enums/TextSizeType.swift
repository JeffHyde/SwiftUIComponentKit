import Foundation

/// The type of size constraints for text
public enum TextSizeType: Equatable {
    case width(Double)
    case height(Double)
    case widthAndHeight(width: Double, height: Double)
    case flexible
    
    public static func == (lhs: TextSizeType, rhs: TextSizeType) -> Bool {
        switch (lhs, rhs) {
        case (.width(let lhsWidth), .width(let rhsWidth)):
            return lhsWidth == rhsWidth
        case (.height(let lhsHeight), .height(let rhsHeight)):
            return lhsHeight == rhsHeight
        case (.widthAndHeight(let lhsWidth, let lhsHeight), .widthAndHeight(let rhsWidth, let rhsHeight)):
            return lhsWidth == rhsWidth && lhsHeight == rhsHeight
        case (.flexible, .flexible):
            return true
        default:
            return false
        }
    }
}
