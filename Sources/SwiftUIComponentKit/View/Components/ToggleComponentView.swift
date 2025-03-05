import SwiftUI

struct ToggleComponentView: View {
    @ObservedObject var viewModel: ToggleComponentViewModel

    var body: some View {
        Toggle("", isOn: $viewModel.isOn)
            .labelsHidden()
            .padding(
                EdgeInsets(
                    top: viewModel.padding.top,
                    leading: viewModel.padding.leading,
                    bottom: viewModel.padding.bottom,
                    trailing: viewModel.padding.trailing
                )
            )
            .horizontallyAligned($viewModel.horizontalAlignment)
    }
}

#Preview {
    ToggleComponentView(viewModel: ToggleComponentViewModel())
}
