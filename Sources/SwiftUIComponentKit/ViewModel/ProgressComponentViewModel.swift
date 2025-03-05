import SwiftUI

open class ProgressComponentViewModel: ComponentViewModel {
    @Published public var style: ProgressStyle
    @Published public var padding: PaddingModel
    public var action: ((String) -> ())?
    
    public init(
        style: ProgressStyle = .wheel,
        padding: PaddingModel = PaddingModel(),
        action: ((String) -> ())? = nil
    ) {
        self.style = style
        self.padding = padding
        self.action = action
    }
}
