import SwiftUI

struct TextFieldBehaviorModifier: ViewModifier {
    let viewModel: TextFieldComponentViewModel

    func body(content: Content) -> some View {
        content
            .autocorrectionDisabled(viewModel.autocorrectionDisabled)
            .textInputAutocapitalization(viewModel.textInputAutocapitalization)
            .keyboardType(viewModel.keyboardType)
            .submitLabel(viewModel.submitLabel)
            .onSubmit(viewModel.onSubmit)
    }
}
