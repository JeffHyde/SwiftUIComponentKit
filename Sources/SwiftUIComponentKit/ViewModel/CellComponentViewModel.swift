import SwiftUI

open class CellComponentViewModel: ComponentViewModel {
    @Published var topTextViewModel: TextComponentViewModel
    @Published var middleTextViewModel: TextComponentViewModel?
    @Published var bottomTextViewModel: TextComponentViewModel?
    @Published var leadingImageViewModel: ImageComponentViewModel?
    @Published var trailingImageViewModel: ImageComponentViewModel?
    @Published var leadingImageAlignment: VerticalAlignment
    @Published var backgroundColor: Color
    @Published var borderColor: Color
    @Published var cornerRadius: CGFloat
    @Published var borderWidth: CGFloat
    @Published var shadowRadius: CGFloat
    @Published var onTap: ((String) -> ())?
    
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
        onTap: ((String) -> ())? = nil
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
        self.onTap = onTap
    }
}
