import SwiftUI

open class TextFieldComponentViewModel: ComponentViewModel {
    @Published public var text: String
    @Published public var localizedPlaceHolder: String
    @Published public var font: Font
    @Published public var horizontalAlignment: HorizontalAlignment?
    @Published public var foregroundColor: Color
    @Published public var backgroundColor: Color
    @Published public var borderColor: Color
    @Published public var borderWidth: Double
    @Published public var cornerRadius: Double
    @Published public var innerPadding: PaddingModel
    @Published public var outerPadding: PaddingModel
    @Published public var autocorrectionDisabled: Bool
    @Published public var textInputAutocapitalization: TextInputAutocapitalization
    @Published public var keyboardType: UIKeyboardType
    @Published public var submitLabel: SubmitLabel
    @Published public var isSecure: Bool
    public var onSubmit: () -> ()
    
    public init(
        text: String,
        localizedPlaceHolder: String = "",
        font: Font = .body,
        horizontalAlignment: HorizontalAlignment? = nil,
        foregroundColor: Color = .primary,
        backgroundColor: Color = .clear,
        borderColor: Color = .clear,
        borderWidth: Double = .zero,
        cornerRadius: Double = .zero,
        innerPadding: PaddingModel = PaddingModel(),
        outerPadding: PaddingModel = PaddingModel(),
        autocorrectionDisabled: Bool = true,
        textInputAutocapitalization: TextInputAutocapitalization = .sentences,
        keyboardType: UIKeyboardType = .default,
        submitLabel: SubmitLabel = .done,
        isSecure: Bool = false,
        onSubmit: @escaping () -> () = {}
        
    ) {
        self.text = text
        self.localizedPlaceHolder = localizedPlaceHolder
        self.font = font
        self.horizontalAlignment = horizontalAlignment
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
        self.innerPadding = innerPadding
        self.outerPadding = outerPadding
        self.autocorrectionDisabled = autocorrectionDisabled
        self.textInputAutocapitalization = textInputAutocapitalization
        self.keyboardType = keyboardType
        self.submitLabel = submitLabel
        self.isSecure = isSecure
        self.onSubmit = onSubmit
    }
}
