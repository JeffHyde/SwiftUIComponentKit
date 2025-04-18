import SwiftUI
import Combine

open class TextComponentViewModel: ComponentViewModel {
    @Published public var textType: TextType
    @Published public var font: Font
    @Published public var textAlignment: TextAlignment
    @Published public var horizontalAlignment: HorizontalAlignment?
    @Published public var foregroundColor: Color
    @Published public var backgroundColor: Color
    @Published public var borderColor: Color
    @Published public var borderWidth: Double
    @Published public var cornerRadius: Double
    @Published public var sizeType: TextSizeType
    @Published public var innerPadding: PaddingModel
    @Published public var outerPadding: PaddingModel
    @Published public var outerBackgroundColor: Color
    public var action: ((String) -> ())?
    
    private var cancellables: Set<AnyCancellable> = Set()
    
    public init(
        textType: TextType,
        font: Font = .body,
        textAlignment: TextAlignment = .center,
        horizontalAlignment: HorizontalAlignment? = nil,
        foregroundColor: Color = .primary,
        backgroundColor: Color = .clear,
        borderColor: Color = .clear,
        borderWidth: Double = .zero,
        cornerRadius: Double = .zero,
        sizeType: TextSizeType = .flexible,
        innerPadding: PaddingModel = PaddingModel(),
        outerPadding: PaddingModel = PaddingModel(),
        outerBackgroundColor: Color = .clear,
        action: ((String) -> ())? = nil
    ) {
        self.textType = textType
        self.font = font
        self.textAlignment = textAlignment
        self.horizontalAlignment = horizontalAlignment
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
        self.sizeType = sizeType
        self.innerPadding = innerPadding
        self.outerPadding = outerPadding
        self.outerBackgroundColor = outerBackgroundColor
        self.action = action
    }
}
