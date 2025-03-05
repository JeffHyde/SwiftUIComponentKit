import SwiftUI

struct PickerStyleModifier: ViewModifier {
    @Binding var type: PickerType
    
    func body(
        content: Content
    ) -> some View {
        switch type {
        case .segmented:
            content.pickerStyle(SegmentedPickerStyle())
        case .menu:
            content.pickerStyle(MenuPickerStyle())
        case .wheel:
            content.pickerStyle(WheelPickerStyle())
        }
    }
}
