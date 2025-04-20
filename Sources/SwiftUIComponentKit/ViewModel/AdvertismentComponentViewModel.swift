import SwiftUI

open class AdvertismentComponentViewModel: ComponentViewModel {
    @Published public var leadingTopTextViewModel: TextComponentViewModel
    @Published public var leadingCenterTextViewModel: TextComponentViewModel?
    @Published public var leadingBottomTextViewModel: TextComponentViewModel?
    @Published public var trailingTopTextViewModel: TextComponentViewModel?
    @Published public var trailingCenterTextViewModel: TextComponentViewModel?
    @Published public var trailingBottomTextViewModel: TextComponentViewModel?
    @Published public var imageViewModel: ImageComponentViewModel?
    @Published public var imagePlacment: HorizontalAlignment
    @Published public var backgroundColor: Color
    @Published public var borderColor: Color
    @Published public var borderWidth: Double
    @Published public var cornerRadius: Double
    @Published public var shadowRadius: Double
    @Published public var innerPadding: PaddingModel
    @Published public var outerPadding: PaddingModel
    public var action: ((String) -> ())?
    
    public init(
        leadingTopTextViewModel: TextComponentViewModel,
        leadingCenterTextViewModel: TextComponentViewModel? = nil,
        leadingBottomTextViewModel: TextComponentViewModel? = nil,
        trailingTopTextViewModel: TextComponentViewModel? = nil,
        trailingCenterTextViewModel: TextComponentViewModel? = nil,
        trailingBottomTextViewModel: TextComponentViewModel? = nil,
        imageViewModel: ImageComponentViewModel? = nil,
        imagePlacment: HorizontalAlignment = .center,
        backgroundColor: Color = .clear,
        borderColor: Color = .clear,
        borderWidth: Double = .none,
        cornerRadius: Double = .none,
        shadowRadius: Double = .none,
        innerPadding: PaddingModel = PaddingModel(),
        outerPadding: PaddingModel = PaddingModel(),
        action: ((String) -> ())? = nil
    ) {
        self.leadingTopTextViewModel = leadingTopTextViewModel
        self.leadingCenterTextViewModel = leadingCenterTextViewModel
        self.leadingBottomTextViewModel = leadingBottomTextViewModel
        self.trailingTopTextViewModel = trailingTopTextViewModel
        self.trailingCenterTextViewModel = trailingCenterTextViewModel
        self.trailingBottomTextViewModel = trailingBottomTextViewModel
        self.imageViewModel = imageViewModel
        self.imagePlacment = imagePlacment
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
        self.shadowRadius = shadowRadius
        self.innerPadding = innerPadding
        self.outerPadding = outerPadding
        self.action = action
    }
}
