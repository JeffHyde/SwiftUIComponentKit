import Foundation

public enum TextType: Equatable {
    case standard(String)
    case attributed(NSMutableAttributedString)
    
    public static func == (lhs: TextType, rhs: TextType) -> Bool {
        switch (lhs, rhs) {
        case (.standard(let lhs), .standard(let rhs)):
            return lhs == rhs
        case (.attributed(let lhs), .attributed(let rhs)):
            return lhs.string == rhs.string
        default:
            return false
        }
    }
}
