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
        #expect(viewModel.padding.top == 0)
        #expect(viewModel.padding.bottom == 0)
        #expect(viewModel.padding.leading == 0)
        #expect(viewModel.padding.trailing == 0)
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
