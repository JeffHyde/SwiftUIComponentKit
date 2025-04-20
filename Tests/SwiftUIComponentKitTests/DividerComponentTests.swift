import Testing
@testable import SwiftUIComponentKit

struct DividerComponentTests {
    @Test func init_with_default() async throws {
        let viewModel = DividerComponentViewModel()
        
        #expect(viewModel.thickness == .xxSmall)
        #expect(viewModel.color == .primary)
        #expect(viewModel.padding.top == .none)
        #expect(viewModel.padding.bottom == .none)
        #expect(viewModel.padding.leading == .none)
        #expect(viewModel.padding.trailing == .none)
        #expect(viewModel.displayType == .vertical)
    }
}
