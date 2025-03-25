import SwiftUI

open class ButtonComponentViewModel: ComponentViewModel {
    @Published public var labelComponent: ViewComponent
    @Published public var padding: PaddingModel
    public var action: ((String) -> ())?

    public init(
        labelComponent: ViewComponent = .text(viewModel: TextComponentViewModel(textType: .standard(""))),
        padding: PaddingModel = PaddingModel(),
        action: ((String) -> ())? = nil
    ) {
        self.labelComponent = labelComponent
        self.padding = padding
        self.action = action
    }
}
