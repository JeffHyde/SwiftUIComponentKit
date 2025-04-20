import Foundation

/// The type of picker style
public enum PickerType: Equatable {
    case segmented
    case menu
    case wheel
    
    public static func == (lhs: PickerType, rhs: PickerType) -> Bool {
        switch (lhs, rhs) {
        case (.segmented, .segmented), (.menu, .menu), (.wheel, .wheel):
            return true
        default:
            return false
        }
    }
}
