import SwiftUI

/// A combination of components to define a cell for any type of cell design
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
    @Published public var padding: PaddingModel
    @Published var navigationDestination: AnyView?
    public var action: ((String) -> ())?
    
    /// Creates a Cell Component with defaults
    /// - Parameters:
    ///   - topTextViewModel: ``TextComponentViewModel``
    ///   - middleTextViewModel: ``TextComponentViewModel``
    ///   - bottomTextViewModel: ``TextComponentViewModel``
    ///   - leadingImageViewModel: ``ImageComponentViewModel``
    ///   - trailingImageViewModel: ``ImageComponentViewModel``
    ///   - leadingImageAlignment: ``VerticalAlignment``
    ///   - backgroundColor: ``Color``
    ///   - borderColor: ``Color``
    ///   - cornerRadius: ``CGFloat``
    ///   - borderWidth: ``CGFloat``
    ///   - shadowRadius: ``CGFloat``
    ///   - padding: ``PaddingModel``
    ///   - navigationDestination: Navigation Stack Destination View, if used set action to nil
    ///   - action: On Tap Action, if used set navigationDestination to nil
    public init(
        topTextViewModel: TextComponentViewModel,
        middleTextViewModel: TextComponentViewModel? = nil,
        bottomTextViewModel: TextComponentViewModel? = nil,
        leadingImageViewModel: ImageComponentViewModel? = nil,
        trailingImageViewModel: ImageComponentViewModel? = nil,
        leadingImageAlignment: VerticalAlignment = .center,
        backgroundColor: Color = .clear,
        borderColor: Color = .clear,
        cornerRadius: CGFloat = .none,
        borderWidth: CGFloat = .none,
        shadowRadius: CGFloat = .none,
        padding: PaddingModel = .all(.none),
        navigationDestination: AnyView? = nil,
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
        self.padding = padding
        self.navigationDestination = navigationDestination
        self.action = action
    }
}
