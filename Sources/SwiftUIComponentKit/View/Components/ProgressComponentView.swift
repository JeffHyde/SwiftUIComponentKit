import SwiftUI

struct ProgressComponentView: View {
    @ObservedObject var viewModel: ProgressComponentViewModel

    var body: some View {
        Group {
            switch viewModel.style {
            case .bar(let title, let progress, let total):
                ProgressView(title, value: progress, total: total)
            case .wheel:
                ProgressView()
            }
        }
        .padding(
            EdgeInsets(
                top: viewModel.padding.top,
                leading: viewModel.padding.leading,
                bottom: viewModel.padding.bottom,
                trailing: viewModel.padding.trailing
            )
        )
        .onTapModifier(id: viewModel.id, onTap: viewModel.onTap)
    }
}

#Preview {
    VStack {
        ProgressComponentView(
            viewModel: ProgressComponentViewModel(
                style: .bar(title: "Title", progress: 50, total: 100),
                padding: .all(.zero),
                onTap: { id in
                    print("Bar Pressed: \(id)")
                }
            )
        )
        ProgressComponentView(viewModel: ProgressComponentViewModel())
    }
}
