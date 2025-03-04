import SwiftUI

open class PickerComponentViewModel: ComponentViewModel {
    @Published var type: PickerType
    @Published var localizedStringKey: String
    @Published var selectedItem: String
    @Published var items: [String]
    @Published var backgroundColor: Color
    @Published var innerPadding: PaddingModel
    @Published var outerPadding: PaddingModel
    @Published var action: ((String) -> ())?
    
    public init(
        type: PickerType = .segmented,
        localizedStringKey: String = "",
        selectedItem: String = "",
        items: [String] = [],
        backgroundColor: Color = .clear,
        innerPadding: PaddingModel = .all(0),
        outerPadding: PaddingModel = .all(0),
        action: ((String) -> ())? = nil
    ) {
        self.type = type
        self.localizedStringKey = localizedStringKey
        self.selectedItem = selectedItem
        self.items = items
        self.backgroundColor = backgroundColor
        self.innerPadding = innerPadding
        self.outerPadding = outerPadding
        self.action = action
    }
}
