import SwiftUI

struct TextFieldComponentView: View {
    @ObservedObject var viewModel: TextFieldComponentViewModel
    var body: some View {
        if viewModel.isSecure {
            MakeTextField(
                SecureField(viewModel.localizedPlaceHolder, text: $viewModel.text)
                    .textFieldBehavior(viewModel)
            )
        } else {
            MakeTextField(
                TextField(viewModel.localizedPlaceHolder, text: $viewModel.text)
                    .textFieldBehavior(viewModel)
            )
        }
    }
    
    @ViewBuilder
    func MakeTextField(_ textField: some View) -> some View {
        textField
            .foregroundColor(viewModel.foregroundColor)
            .font(viewModel.font)
            .padding(
                EdgeInsets(
                    top: viewModel.innerPadding.top,
                    leading: viewModel.innerPadding.leading,
                    bottom: viewModel.innerPadding.bottom,
                    trailing: viewModel.innerPadding.trailing
                )
            )
            .background(
                RoundedRectangle(cornerRadius: viewModel.cornerRadius)
                    .fill(viewModel.backgroundColor)
            )
            .overlay(
                RoundedRectangle(cornerRadius: viewModel.cornerRadius)
                    .stroke(viewModel.borderColor, lineWidth: viewModel.borderWidth)
            )
            .padding(
                EdgeInsets(
                    top: viewModel.outerPadding.top,
                    leading: viewModel.outerPadding.leading,
                    bottom: viewModel.outerPadding.bottom,
                    trailing: viewModel.outerPadding.trailing
                )
            )
            .horizontallyAligned($viewModel.horizontalAlignment)
    }
}

#Preview {
    TextFieldComponentView(
        viewModel: TextFieldComponentViewModel(
            text: "",
            localizedPlaceHolder: "Input",
            font: .largeTitle,
            foregroundColor: .primary,
            backgroundColor: Color(uiColor: .secondarySystemFill),
            borderColor: .primary,
            borderWidth: .xxxSmall,
            cornerRadius: .medium,
            innerPadding: .all(.large),
            outerPadding: .all(.medium),
            isSecure: false,
        )
    )
}
