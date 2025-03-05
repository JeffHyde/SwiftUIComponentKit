import SwiftUI

open class ToggleComponentViewModel: ComponentViewModel {
    @Published var isOn: Bool
    @Published var horizontalAlignment: HorizontalAlignment?
    @Published var padding: PaddingModel
    
    public init(
        isOn: Bool = false,
        horizontalAlignment: HorizontalAlignment? = .none,
        padding: PaddingModel = PaddingModel()
    ) {
        self.isOn = isOn
        self.horizontalAlignment = horizontalAlignment
        self.padding = padding
    }
}
