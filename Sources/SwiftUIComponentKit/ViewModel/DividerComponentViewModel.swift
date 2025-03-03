import SwiftUI

open class DividerComponentViewModel: ComponentViewModel {
    @Published var thickness: Double
    @Published var color: Color
    @Published var padding: PaddingModel
    @Published var displayType: DisplayType
    
    public init(
        thickness: Double = 1,
        color: Color = .primary,
        padding: PaddingModel = PaddingModel(),
        displayType: DisplayType = .vertical
    ) {
        self.thickness = thickness
        self.color = color
        self.padding = padding
        self.displayType = displayType
    }
}
