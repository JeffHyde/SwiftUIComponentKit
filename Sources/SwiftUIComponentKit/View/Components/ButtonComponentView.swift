import SwiftUI

struct ButtonComponentView: View {
    @ObservedObject var viewModel: ButtonComponentViewModel

    var body: some View {
        Button(role: .none) {
            viewModel.action?(viewModel.id)
        } label: {
            ComponentView(viewComponent: viewModel.labelComponent)
        }
        .padding(
            EdgeInsets(
                top: viewModel.padding.top,
                leading: viewModel.padding.leading,
                bottom: viewModel.padding.bottom,
                trailing: viewModel.padding.trailing
            )
        )
    }
}

#Preview {
    ButtonComponentView(
        viewModel: ButtonComponentViewModel(
            labelComponent: .text(
                viewModel: TextComponentViewModel(
                    textType: .standard("Hello"),
                    backgroundColor: .green,
                    cornerRadius: 16,
                    innerPadding: .all(16)
                )
            ),
            padding: .all(0),
            action: { id in
                print("Button Pressed: \(id)")
            }
        )
    )
}
