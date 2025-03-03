import Testing
@testable import SwiftUIComponentKit

struct DividerComponentTests {
    @Test func init_with_default() async throws {
        let viewModel = DividerComponentViewModel()
        
        #expect(viewModel.thickness == 1)
        #expect(viewModel.color == .primary)
        #expect(viewModel.padding.top == 0)
        #expect(viewModel.padding.bottom == 0)
        #expect(viewModel.padding.leading == 0)
        #expect(viewModel.padding.trailing == 0)

        if case .vertical = viewModel.displayType {
            #expect(true)
        } else {
            #expect(Bool(false))
        }
    }
}
