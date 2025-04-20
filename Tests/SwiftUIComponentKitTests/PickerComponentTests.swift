import Testing
@testable import SwiftUIComponentKit

struct PickerComponentTests {
    @Test func init_with_default() async throws {
        let viewModel = PickerComponentViewModel()
        
        #expect(viewModel.type == .segmented)
        #expect(viewModel.localizedStringKey == "")
        #expect(viewModel.selectedItem == "")
        #expect(viewModel.items == [])
        #expect(viewModel.backgroundColor == .clear)
        #expect(viewModel.innerPadding.top == .none)
        #expect(viewModel.innerPadding.bottom == .none)
        #expect(viewModel.innerPadding.leading == .none)
        #expect(viewModel.innerPadding.trailing == .none)
        #expect(viewModel.outerPadding.top == .none)
        #expect(viewModel.outerPadding.bottom == .none)
        #expect(viewModel.outerPadding.leading == .none)
        #expect(viewModel.outerPadding.trailing == .none)
        #expect(viewModel.action == nil)
    }
    
    @Test func test_action() async throws {
        var output: String?
        let viewModel = PickerComponentViewModel(
            selectedItem: "1",
            items: ["1", "2", "3"],
            action: { value in
                output = value
            }
        )
        
        viewModel.selectedItem = viewModel.items[1]
        viewModel.action?(viewModel.selectedItem)
        try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
        
        #expect(output != nil)
        #expect(output == "2")
    }
}
