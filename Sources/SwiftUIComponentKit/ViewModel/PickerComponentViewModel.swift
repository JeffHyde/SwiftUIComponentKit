import SwiftUI

open class PickerComponentViewModel: ComponentViewModel {
    @Published public var type: PickerType
    @Published public var localizedStringKey: String
    @Published public var selectedItem: String
    @Published public var items: [String]
    @Published public var backgroundColor: Color
    @Published public var innerPadding: PaddingModel
    @Published public var outerPadding: PaddingModel
    public var action: ((String) -> ())?
    
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
