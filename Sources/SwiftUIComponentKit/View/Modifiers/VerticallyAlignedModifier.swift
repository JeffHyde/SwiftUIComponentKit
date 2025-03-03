import SwiftUI

struct VerticallyAlignedModifier: ViewModifier {
    var alignment: VerticalAlignment?
    
    func body(
        content: Content
    ) -> some View {
        switch alignment {
        case .top:
            VStack(spacing: .zero) {
                content
                Spacer()
            }
        case .bottom:
            VStack(spacing: .zero) {
                Spacer()
                content
            }
        case .center:
            VStack(spacing: .zero) {
                Spacer()
                content
                Spacer()
            }
        default:
            content
        }
    }
}
