import SwiftUI

/// The Base View Type for ``SwiftUIComponentKit``.
///
/// An enumerated type representing different ``View`` components within the ``SwiftUIComponentKit``.
public enum ViewComponent: Equatable, Identifiable, Hashable {
    case advertisment(viewModel: AdvertismentComponentViewModel)
    case button(viewModel: ButtonComponentViewModel)
    case cell(viewModel: CellComponentViewModel)
    case divider(viewModel: DividerComponentViewModel)
    case image(viewModel: ImageComponentViewModel)
    case picker(viewModel: PickerComponentViewModel)
    case progress(viewModel: ProgressComponentViewModel)
    case slider(viewModel: SliderComponentViewModel)
    case text(viewModel: TextComponentViewModel)
    case textField(viewModel: TextFieldComponentViewModel)
    case toggle(viewModel: ToggleComponentViewModel)
    
    public var id: String {
        switch self {
        case .advertisment(let vm): return vm.id
        case .button(let vm): return vm.id
        case .cell(let vm): return vm.id
        case .divider(let vm): return vm.id
        case .image(let vm): return vm.id
        case .picker(let vm): return vm.id
        case .progress(let vm): return vm.id
        case .slider(let vm): return vm.id
        case .text(let vm): return vm.id
        case .textField(let vm): return vm.id
        case .toggle(let vm): return vm.id
        }
    }
    
    public static func == (lhs: ViewComponent, rhs: ViewComponent) -> Bool {
        switch (lhs, rhs) {
        case let (.advertisment(a), .advertisment(b)):
            return a == b
        case let (.button(a), .button(b)):
            return a == b
        case let (.cell(a), .cell(b)):
            return a == b
        case let (.divider(a), .divider(b)):
            return a == b
        case let (.image(a), .image(b)):
            return a == b
        case let (.picker(a), .picker(b)):
            return a == b
        case let (.progress(a), .progress(b)):
            return a == b
        case let (.slider(a), .slider(b)):
            return a == b
        case let (.text(a), .text(b)):
            return a == b
        case let (.textField(a), .textField(b)):
            return a == b
        case let (.toggle(a), .toggle(b)):
            return a == b
        default:
            return false
        }
    }
}
