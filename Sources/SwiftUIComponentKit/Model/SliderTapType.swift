import Foundation

/// The type of tap gesture used for a slider
public enum SliderTapType: Equatable {
    /// No tap gesture
    case none
    
    /// A closure type with an ID for recognition
    case custom((_ id: String)->())
    
    /// Used for the ``SliderComponentView``,
    case pointConversion
    
    public static func == (lhs: SliderTapType, rhs: SliderTapType) -> Bool {
        switch (lhs, rhs) {
        case (.none, .none), (.pointConversion, .pointConversion):
            return true
        case (.custom, .custom):
            return false
        default:
            return false
        }
    }
}
