import SwiftUI

struct HorizontalComponentView: View {
    let components: [ViewComponent]
    let spacing: Double
    
    init(
        components: [ViewComponent],
        spacing: Double = .zero
    ) {
        self.components = components
        self.spacing = spacing
    }
    
    var body: some View {
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
