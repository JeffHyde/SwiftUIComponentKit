import Testing
@testable import SwiftUIComponentKit

struct ToggleComponentTests {
    @Test func init_with_default() async throws {
        let viewModel = ToggleComponentViewModel()
        
        #expect(viewModel.isOn == false)
        #expect(viewModel.horizontalAlignment == .center)
        #expect(viewModel.padding.top == 0)
        #expect(viewModel.padding.bottom == 0)
        #expect(viewModel.padding.leading == 0)
        #expect(viewModel.padding.trailing == 0)
    }
}
