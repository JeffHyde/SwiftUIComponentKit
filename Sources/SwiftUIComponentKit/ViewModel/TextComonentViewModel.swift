import SwiftUI
import Combine

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
    
    private var cancellables: Set<AnyCancellable> = Set()
    
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
        
        super.init()
        
        update()
    }
    
    func update() {
        $textType
            .receive(on: DispatchQueue.main)
            .sink { [weak self] output in
                switch output {
                case .standard(let string):
                    self?.textString = string
                case .attributed(let attributedString):
                    self?.textString = attributedString.string
                }
            }
            .store(in: &cancellables)
    }
}

public enum TextType {
    case standard(String)
    case attributed(NSMutableAttributedString)
}


import Combine

class MyTextComponentViewModel: TextComponentViewModel {
    @Environment(\.sizeCategory) private var sizeCategory
    @Published var tapCount: Int = 0
    private var cancellables: Set<AnyCancellable> = Set()
    
    init(text: String) {
        super.init(
            textType: .standard(text),
            textAlignment: .center,
            horizontalAlignment: .center,
            foregroundColor: .primary,
            backgroundColor: .secondary,
            borderColor: .primary,
            borderWidth: .small,
            cornerRadius:  .small,
            sizeType: .height(.xxxLarge),
            innerPadding: .all(.medium),
            outerPadding: .horizontal(.large),
            outerBackgroundColor: .clear
        )
        
        self.font = .clampedFont(for: sizeCategory, minSize: 10, maxSize: 24, weight: .bold)
        self.onTap = { [weak self] _ in
            self?.itemTapped()
        }
        
        updateText()
    }
    
    private func updateText() {
        $tapCount
            .receive(on: DispatchQueue.main)
            .sink { output in
                self.textType = .standard("\(self.textString): \(output)")
            }
            .store(in: &cancellables)
    }
    
    func itemTapped() {
        self.tapCount += 1
    }
}

struct MyComponentScreen: View {
    @StateObject var myTextViewModel = MyTextComponentViewModel(text: "Tap Count")

    var body: some View {
        ComponentView(viewComponent: .text(viewModel: myTextViewModel))
    }
}

#Preview {
  MyComponentScreen()
}
