import SwiftUI

public struct HorizontalComponentView: View {
    public var components: [ViewComponent]
    public var spacing: Double
    
    public init(
        components: [ViewComponent],
        spacing: Double = .zero
    ) {
        self.components = components
        self.spacing = spacing
    }
    
    public var body: some View {
        HStack(spacing: spacing) {
            ForEach(Array(components.enumerated()), id: \.offset) { (_, component) in
              ComponentView(viewComponent: component)
            }
            Spacer()
        }
    }
}

#Preview {
    HorizontalComponentView(
        components: [
            .text(viewModel: TextComponentViewModel(textType: .standard("Hello"))),
            .divider(viewModel: DividerComponentViewModel(displayType: .horizontal)),
            .text(viewModel: TextComponentViewModel(textType: .standard("Hello")))
        ],
        spacing: 16
    )
}
