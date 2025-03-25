import SwiftUI

/// The Base View for ``SwiftUIComponentKit``.
///
/// Renders the appropriate component based on the provided ``ViewComponent``.
public struct ComponentView: View {
    private let viewComponent: ViewComponent
    
    public init(viewComponent: ViewComponent) {
        self.viewComponent = viewComponent
    }
    
    public var body: some View {
        switch viewComponent {
        case .advertisment(viewModel: let viewModel):
            AdvertismentComponentView(viewModel: viewModel)
        case .button(let viewModel):
            ButtonComponentView(viewModel: viewModel)
        case .cell(let viewModel):
            CellComponentView(viewModel: viewModel)
        case .divider(let viewModel):
            DividerComponentView(viewModel: viewModel)
        case .image(let viewModel):
            ImageComponentView(viewModel: viewModel)
        case .picker(let viewModel):
            PickerComponentView(viewModel: viewModel)
        case .progress(let viewModel):
            ProgressComponentView(viewModel: viewModel)
        case .slider(let viewModel):
            SliderComponentView(viewModel: viewModel)
        case .text(let viewModel):
            TextComponentView(viewModel: viewModel)
        case .textField(let viewModel):
            TextFieldComponentView(viewModel: viewModel)
        case .toggle(let viewModel):
            ToggleComponentView(viewModel: viewModel)
        }
    }
}
