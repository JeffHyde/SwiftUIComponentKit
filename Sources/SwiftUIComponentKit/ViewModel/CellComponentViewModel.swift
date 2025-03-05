import SwiftUI

open class CellComponentViewModel: ComponentViewModel {
    @Published public var topTextViewModel: TextComponentViewModel
    @Published public var middleTextViewModel: TextComponentViewModel?
    @Published public var bottomTextViewModel: TextComponentViewModel?
    @Published public var leadingImageViewModel: ImageComponentViewModel?
    @Published public var trailingImageViewModel: ImageComponentViewModel?
    @Published public var leadingImageAlignment: VerticalAlignment
    @Published public var backgroundColor: Color
    @Published public var borderColor: Color
    @Published public var cornerRadius: CGFloat
    @Published public var borderWidth: CGFloat
    @Published public var shadowRadius: CGFloat
    public var action: ((String) -> ())?
    
    public init(
        topTextViewModel: TextComponentViewModel,
        middleTextViewModel: TextComponentViewModel? = nil,
        bottomTextViewModel: TextComponentViewModel? = nil,
        leadingImageViewModel: ImageComponentViewModel? = nil,
        trailingImageViewModel: ImageComponentViewModel? = nil,
        leadingImageAlignment: VerticalAlignment = .center,
        backgroundColor: Color = .clear,
        borderColor: Color = .clear,
        cornerRadius: CGFloat = 0.0,
        borderWidth: CGFloat = 0.0,
        shadowRadius: CGFloat = 0.0,
        action: ((String) -> ())? = nil
    ) {
        self.topTextViewModel = topTextViewModel
        self.middleTextViewModel = middleTextViewModel
        self.bottomTextViewModel = bottomTextViewModel
        self.leadingImageViewModel = leadingImageViewModel
        self.trailingImageViewModel = trailingImageViewModel
        self.leadingImageAlignment = leadingImageAlignment
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.shadowRadius = shadowRadius
        self.action = action
    }
}
