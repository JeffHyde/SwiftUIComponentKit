import Testing
@testable import SwiftUIComponentKit

struct ProgressComponentTests {
    @Test func init_with_default() async throws {
        let viewModel = ProgressComponentViewModel()
            
        #expect(viewModel.style == .wheel)
        #expect(viewModel.padding.top == .none)
        #expect(viewModel.padding.bottom == .none)
        #expect(viewModel.padding.leading == .none)
        #expect(viewModel.padding.trailing == .none)
        #expect(viewModel.action == nil)
    }
}
