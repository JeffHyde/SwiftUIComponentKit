import SwiftUI

open class ButtonComponentViewModel: ComponentViewModel {
    @Published var labelComponent: ViewComponent
    @Published var padding: PaddingModel
    @Published var action: ((String) -> ())?

    public init(
        labelComponent: ViewComponent = .text(viewModel: TextComponentViewModel(textType: .standard("Hello"))),
        padding: PaddingModel = PaddingModel(),
        action: ((String) -> ())? = nil
    ) {
        self.labelComponent = labelComponent
        self.padding = padding
        self.action = action
    }
}
