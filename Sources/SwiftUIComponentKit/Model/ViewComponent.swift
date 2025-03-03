import SwiftUI

/// The Base Type for ``SwiftUIComponentKit``.
///
/// An enumerted type representing different view components within the ``SwiftUIComponentKit``.
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
}
