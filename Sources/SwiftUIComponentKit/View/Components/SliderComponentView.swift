import SwiftUI

struct SliderComponentView: View {
    @ObservedObject var viewModel: SliderComponentViewModel
    
    var body: some View {
        GeometryReader { proxy in
            Slider(
                value: $viewModel.value,
                in: viewModel.range
            )
            .padding(
                EdgeInsets(
                    top: viewModel.padding.top,
                    leading: viewModel.padding.leading,
                    bottom: viewModel.padding.bottom,
                    trailing: viewModel.padding.trailing
                )
            )
            .onTapGesture(
                count: viewModel.tapCount,
                coordinateSpace: .local,
                perform: { point in
                    switch viewModel.tapType {
                    case .none:
                        break
                    case .custom(let id, let closure):
                        closure(id)
                    case .pointConversion:
                        viewModel.handleTapConversion(point, proxy.size.width)
                    }
                }
            )
        }
    }
}

#Preview {
    SliderComponentView(viewModel: SliderComponentViewModel(tapType: .pointConversion))
}
