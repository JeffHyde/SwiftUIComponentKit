import SwiftUI

open class DividerComponentViewModel: ComponentViewModel {
    @Published public var thickness: CGFloat
    @Published public var color: Color
    @Published public var padding: PaddingModel
    @Published public var displayType: DisplayType
    
    public init(
        thickness: CGFloat = 1,
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
