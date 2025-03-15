import SwiftUI

public struct ScrollableComponentView: View {
    public var headerComponents: [ViewComponent]
    public var scrollableComponents: [ViewComponent]
    public var footerComponents: [ViewComponent]
    public var scrollAxis: Axis.Set
    public var contentSpacing: CGFloat
    public var headerSpacing: CGFloat
    public var scrollSpacing: CGFloat
    public var footerSpacing: CGFloat
    public var backgroundColor: Color
    public var refreshable: Bool
    public var onRefresh: () -> ()
    
    public init(
        headerComponents: [ViewComponent] = [],
        scrollableComponents: [ViewComponent],
        footerComponents: [ViewComponent] = [],
        scrollAxis: Axis.Set = .vertical,
        contentSpacing: CGFloat = .zero,
        headerSpacing: CGFloat = .zero,
        scrollSpacing: CGFloat = .zero,
        footerSpacing: CGFloat = .zero,
        backgroundColor: Color = .clear,
        refreshable: Bool = false,
        onRefresh: @escaping () -> () = {}
    ) {
        self.headerComponents = headerComponents
        self.scrollableComponents = scrollableComponents
        self.footerComponents = footerComponents
        self.scrollAxis = scrollAxis
        self.contentSpacing = contentSpacing
        self.headerSpacing = headerSpacing
        self.scrollSpacing = scrollSpacing
        self.footerSpacing = footerSpacing
        self.backgroundColor = backgroundColor
        self.refreshable = refreshable
        self.onRefresh = onRefresh
    }
    
    public var body: some View {
        VStack(spacing: contentSpacing) {
            VerticalComponentView(components: headerComponents, spacing: headerSpacing)
            
            ScrollView(scrollAxis) {
                switch scrollAxis {
                case .horizontal:
                    HorizontalComponentView(components: scrollableComponents, spacing: scrollSpacing)
                default:
                    VerticalComponentView(components: scrollableComponents, spacing: scrollSpacing)
                }
            }
            .refresh(refreshable: refreshable) {
                onRefresh()
            }
            
            VerticalComponentView(components: footerComponents, spacing: footerSpacing)
        }
        .background(backgroundColor)
    }
}

#Preview {
    ScrollableComponentView(
        headerComponents: [.text(viewModel: TextComponentViewModel(textType: .standard("Hello")))],
        scrollableComponents: [
            .text(viewModel: TextComponentViewModel(textType: .standard("Hello"))),
            .text(viewModel: TextComponentViewModel(textType: .standard("Hello"))),
            .text(viewModel: TextComponentViewModel(textType: .standard("Hello"))),
            .divider(viewModel: DividerComponentViewModel()),
            .text(viewModel: TextComponentViewModel(textType: .standard("Hello"))),
            .text(viewModel: TextComponentViewModel(textType: .standard("Hello"))),
            .text(viewModel: TextComponentViewModel(textType: .standard("Hello"))),
            .divider(viewModel: DividerComponentViewModel())
        ],
        footerComponents: [.text(viewModel: TextComponentViewModel(textType: .standard("Hello")))]
    )
}
