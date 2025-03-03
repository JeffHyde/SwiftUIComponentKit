import SwiftUI

open class ProgressComponentViewModel: ComponentViewModel {
    @Published var style: ProgressStyle
    @Published var padding: PaddingModel
    @Published var onTap:  ((String) -> ())?
    
    public init(
        style: ProgressStyle = .wheel,
        padding: PaddingModel = PaddingModel(),
        onTap: ((String) -> ())? = nil
    ) {
        self.style = style
        self.padding = padding
        self.onTap = onTap
    }
}
