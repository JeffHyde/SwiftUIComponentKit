import SwiftUI

struct HorizontallyAlignedModifier: ViewModifier {
    @Binding var alignment: HorizontalAlignment?
    
    func body(
        content: Content
    ) -> some View {
        switch alignment {
        case .leading:
            HStack(spacing: .zero) {
                content
                Spacer()
            }
        case .trailing:
            HStack(spacing: .zero) {
                Spacer()
                content
            }
        case .center:
            HStack(spacing: .zero) {
                Spacer()
                content
                Spacer()
            }
        default:
            content
        }
    }
}
