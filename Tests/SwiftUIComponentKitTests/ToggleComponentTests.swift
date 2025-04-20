import Testing
@testable import SwiftUIComponentKit

struct ToggleComponentTests {
    @Test func init_with_default() async throws {
        let viewModel = ToggleComponentViewModel()
        
        #expect(viewModel.isOn == false)
        #expect(viewModel.horizontalAlignment == .none)
        #expect(viewModel.padding.top == .none)
        #expect(viewModel.padding.bottom == .none)
        #expect(viewModel.padding.leading == .none)
        #expect(viewModel.padding.trailing == .none)
    }
}
