import SwiftUI

struct PickerComponentView: View {
    @ObservedObject var viewModel: PickerComponentViewModel

    var body: some View {
        Picker(viewModel.localizedStringKey, selection: $viewModel.selectedItem) {
            ForEach(viewModel.items, id: \.self) { item in
                Text(item)
            }
        }
        .pickerType(viewModel.type)
        .onChange(of: viewModel.selectedItem) { oldValue, value in
            viewModel.action?(value)
        }
        .background(RoundedRectangle(cornerRadius: 6).foregroundStyle(viewModel.backgroundColor))
    }
}

#Preview {
    let models = [
        "1",
        "2",
        "3"
    ]
    PickerComponentView(
        viewModel: PickerComponentViewModel(
            type: .segmented,
            selectedItem: models[0],
            items: models,
            backgroundColor: .clear,
            action: { item in
                print("Item Selected: \(item)")
            }
        )
    ).padding(16)
}
