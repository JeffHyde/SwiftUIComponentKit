import SwiftUI

/// The Base View Type for ``SwiftUIComponentKit``.
///
/// An enumerated type representing different ``View`` components within the ``SwiftUIComponentKit``.
public enum ViewComponent {
    case button(viewModel: ButtonComponentViewModel)
    case cell(viewModel: CellComponentViewModel)
    case divider(viewModel: DividerComponentViewModel)
    case image(viewModel: ImageComponentViewModel)
    case picker(viewModel: PickerComponentViewModel)
    case progress(viewModel: ProgressComponentViewModel)
    case slider(viewModel: SliderComponentViewModel)
    case text(viewModel: TextComponentViewModel)
    case toggle(viewModel: ToggleComponentViewModel)
    
    case advertisment(viewModel: AdvertismentComponentViewModel)
}
