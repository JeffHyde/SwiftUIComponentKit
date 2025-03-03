import SwiftUI

struct VerticalComponentView: View {
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
        VStack(spacing: spacing) {
            ForEach(Array(components.enumerated()), id: \.offset) { (_, component) in
              ComponentView(viewComponent: component)
            }
        }
    }
}
