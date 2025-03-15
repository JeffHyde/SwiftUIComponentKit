import SwiftUI

public struct VerticalComponentView: View {
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
        VStack(spacing: spacing) {
            ForEach(Array(components.enumerated()), id: \.offset) { (_, component) in
              ComponentView(viewComponent: component)
            }
        }
    }
}

#Preview {
    VerticalComponentView(
        components: [
            .text(viewModel: TextComponentViewModel(textType: .standard("Text"))),
            .divider(viewModel: DividerComponentViewModel()),
            .button(viewModel: ButtonComponentViewModel(labelComponent: .text(viewModel: TextComponentViewModel(textType: .standard("Button")))))
            
        ],
        spacing: .xLarge
    )
}
