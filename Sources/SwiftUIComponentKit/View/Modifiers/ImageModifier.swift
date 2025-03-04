import SwiftUI

struct ImageModifier: ViewModifier {
    var viewModel: ImageComponentViewModel
    
    func width() -> CGFloat? {
        if let width = viewModel.width {
            return width + viewModel.innerPadding.leading + viewModel.innerPadding.trailing
        } else {
            return nil
        }
    }
    
    func height() -> CGFloat? {
        if let height = viewModel.height {
            return height + viewModel.innerPadding.top + viewModel.innerPadding.bottom
        } else {
            return nil
        }
    }
    
    func body(content: Content) -> some View {
        content
            .frame(width: viewModel.width, height: viewModel.height)
            .clipShape(RoundedRectangle(cornerRadius: viewModel.innerCornerRadius))
            .padding(
                EdgeInsets(
                    top: viewModel.innerPadding.top,
                    leading: viewModel.innerPadding.leading,
                    bottom: viewModel.innerPadding.bottom,
                    trailing: viewModel.innerPadding.trailing
                )
            )
            .background(
                RoundedRectangle(cornerRadius: viewModel.outerCornerRadius)
                    .foregroundStyle(viewModel.backgroundColor)
            )
            .clipShape(RoundedRectangle(cornerRadius: viewModel.outerCornerRadius))
            .overlay(
                RoundedRectangle(cornerRadius: viewModel.outerCornerRadius)
                    .strokeBorder(viewModel.borderColor, lineWidth: viewModel.borderWidth)
            )
            .padding(
                EdgeInsets(
                    top: viewModel.outerPadding.top,
                    leading: viewModel.outerPadding.leading,
                    bottom: viewModel.outerPadding.bottom,
                    trailing: viewModel.outerPadding.trailing
                )
            )
            .onTapModifier(id: viewModel.id, onTap: viewModel.onTap)
    }
}
