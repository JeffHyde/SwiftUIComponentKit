import SwiftUI

struct DividerComponentView: View {
    @ObservedObject var viewModel: DividerComponentViewModel
    
    init(viewModel: DividerComponentViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Rectangle()
            .fill(viewModel.color)
            .framed(viewModel.displayType, size: viewModel.thickness)
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
    DividerComponentView(viewModel: DividerComponentViewModel())
}
