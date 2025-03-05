import SwiftUI

struct PickerComponentView: View {
    @ObservedObject var viewModel: PickerComponentViewModel

    var body: some View {
        Picker(viewModel.localizedStringKey, selection: $viewModel.selectedItem) {
            ForEach(viewModel.items, id: \.self) { item in
                Text(item)
            }
        }
        .pickerType($viewModel.type)
        .onChange(of: viewModel.selectedItem) { oldValue, value in
            viewModel.action?(value)
        }
        .padding(
            EdgeInsets(
                top: viewModel.innerPadding.top,
                leading: viewModel.innerPadding.leading,
                bottom: viewModel.innerPadding.bottom,
                trailing: viewModel.innerPadding.trailing
            )
        )
        .background(RoundedRectangle(cornerRadius: 6).foregroundStyle(viewModel.backgroundColor))
        .padding(
            EdgeInsets(
                top: viewModel.innerPadding.top,
                leading: viewModel.innerPadding.leading,
                bottom: viewModel.innerPadding.bottom,
                trailing: viewModel.innerPadding.trailing
            )
        )
    }
}

#Preview {
    let items = [
        "1",
        "2",
        "3"
    ]
    
    PickerComponentView(
        viewModel: PickerComponentViewModel(
            type: .segmented,
            selectedItem: items[0],
            items: items,
            backgroundColor: .blue,
            innerPadding: .all(.xSmall),
            outerPadding: .all(.large),
            action: { item in
                print("Item Selected: \(item)")
            }
        )
    )
}
