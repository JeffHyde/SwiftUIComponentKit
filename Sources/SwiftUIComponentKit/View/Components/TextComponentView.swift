import SwiftUI

struct TextComponentView: View {
    @ObservedObject var viewModel: TextComponentViewModel
    
    init(viewModel: TextComponentViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Group {
            switch viewModel.textType {
            case .standard(let string):
                Text(string)
                    .font(viewModel.font)
                    .foregroundColor(viewModel.foregroundColor)
            case .attributed(let attributedString):
                Text(AttributedString(attributedString))
            }
        }
        .multilineTextAlignment(viewModel.textAlignment)
        .padding(
            EdgeInsets(
                top: viewModel.innerPadding.top,
                leading: viewModel.innerPadding.leading,
                bottom: viewModel.innerPadding.bottom,
                trailing: viewModel.innerPadding.trailing
            )
        )
        .textSize($viewModel.sizeType)
        .background(
            RoundedRectangle(cornerRadius: viewModel.cornerRadius)
                .fill(viewModel.backgroundColor)
        )
        .overlay(
            RoundedRectangle(cornerRadius: viewModel.cornerRadius)
                .stroke(viewModel.borderColor, lineWidth: viewModel.borderWidth)
        )
        .onTapModifier(id: viewModel.id, onTap: viewModel.action)
        .padding(
            EdgeInsets(
                top: viewModel.outerPadding.top,
                leading: viewModel.outerPadding.leading,
                bottom: viewModel.outerPadding.bottom,
                trailing: viewModel.outerPadding.trailing
            )
        )
        .horizontallyAligned($viewModel.horizontalAlignment)
        .background(viewModel.outerBackgroundColor)
    }
}

#Preview {
    @Previewable @Environment(\.dynamicTypeSize) var dynamicTypeSize
    let attributedString: NSMutableAttributedString = {
        let text = "Hello World"
        var string = NSMutableAttributedString(string: text)
        string.addAttributes(
            [
                .foregroundColor: UIColor.yellow,
                .underlineStyle: NSUnderlineStyle.single.union(.patternDot).rawValue,
                .underlineColor: UIColor.green
            ],
            range: NSRange(location: 0, length: text.count)
        )
        
        return string
    }()
    
    VStack {
        TextComponentView(
            viewModel: TextComponentViewModel(
                textType: .standard("Hello World!"),
                font: .clampedFont(for: dynamicTypeSize),
                textAlignment: .center,
                foregroundColor: .primary,
                backgroundColor: .secondary,
                borderColor: .primary,
                borderWidth: .xSmall,
                cornerRadius: .xLarge,
                sizeType: .flexable,
                innerPadding: .all(.xLarge),
                outerPadding: .all(.none),
                action: { id in
                    print("On Tap: \(id)")
                }
            )
        )
        
        TextComponentView(
            viewModel: TextComponentViewModel(
                textType: .attributed(attributedString),
                backgroundColor: .secondary,
                borderColor: .red,
                borderWidth: .small,
                cornerRadius: .small,
                sizeType: .widthAndHeight(width: 200, height: 80),
                innerPadding: .all(.large),
                outerPadding: .all(.none),
                action: { id in
                    print("On Tap: \(id)")
                }
            )
        )
    }
}
