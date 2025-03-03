import SwiftUI

open class TextComponentViewModel: ComponentViewModel {
    @Published var textType: TextType
    @Published var font: Font
    @Published var textAlignment: TextAlignment
    @Published var horizontalAlignment: HorizontalAlignment?
    @Published var foregroundColor: Color
    @Published var backgroundColor: Color
    @Published var borderColor: Color
    @Published var borderWidth: Double
    @Published var cornerRadius: Double
    @Published var sizeType: TextSizeType
    @Published var innerPadding: PaddingModel
    @Published var outerPadding: PaddingModel
    @Published var outerBackgroundColor: Color
    var onTap: ((String) -> ())?
    var textString: String = ""
    
    public init(
        textType: TextType,
        font: Font = Font.body,
        textAlignment: TextAlignment = .center,
        horizontalAlignment: HorizontalAlignment? = nil,
        foregroundColor: Color = .primary,
        backgroundColor: Color = .clear,
        borderColor: Color = .clear,
        borderWidth: Double = .zero,
        cornerRadius: Double = .zero,
        sizeType: TextSizeType = .flexable,
        innerPadding: PaddingModel = PaddingModel(),
        outerPadding: PaddingModel = PaddingModel(),
        outerBackgroundColor: Color = .clear,
        onTap: ((String) -> ())? = nil
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
        self.onTap = onTap
        
        switch textType {
        case .standard(let string):
            self.textString = string
        case .attributed(let attributedString):
            self.textString = attributedString.string
        }
    }
}

public enum TextType {
    case standard(String)
    case attributed(NSMutableAttributedString)
}
