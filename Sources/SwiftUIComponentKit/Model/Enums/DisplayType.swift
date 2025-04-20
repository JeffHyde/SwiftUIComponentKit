import Foundation

/// An enumerated type used for vertical or horizontal layout
public enum DisplayType: Equatable {
    case vertical, horizontal
    
    public static func == (lhs: DisplayType, rhs: DisplayType) -> Bool {
        switch (lhs, rhs) {
        case (.vertical, .vertical), (.horizontal, .horizontal):
            return true
        default:
            return false
        }
    }
}
