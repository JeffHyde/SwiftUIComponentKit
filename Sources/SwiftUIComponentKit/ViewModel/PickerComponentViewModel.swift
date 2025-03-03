import SwiftUI

open class PickerComponentViewModel: ComponentViewModel {
    @Published var type: PickerType
    @Published var localizedStringKey: String
    @Published var selectedItem: String
    @Published var items: [String]
    @Published var backgroundColor: Color
    @Published var padding: PaddingModel
    @Published var action: ((String) -> ())?
    
    public init(
        type: PickerType = .segmented,
        localizedStringKey: String = "",
        selectedItem: String = "",
        items: [String] = [],
        backgroundColor: Color = .clear,
        padding: PaddingModel = PaddingModel(),
        action: ((String) -> ())? = nil
    ) {
        self.type = type
        self.localizedStringKey = localizedStringKey
        self.selectedItem = selectedItem
        self.items = items
        self.backgroundColor = backgroundColor
        self.padding = padding
        self.action = action
    }
}
