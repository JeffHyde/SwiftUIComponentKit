import Testing
@testable import SwiftUIComponentKit

struct ButtonComponentTests {
    @Test func init_with_default() async throws {
        let viewModel = ButtonComponentViewModel()
       
        #expect(viewModel.padding.top == 0)
        #expect(viewModel.padding.bottom == 0)
        #expect(viewModel.padding.leading == 0)
        #expect(viewModel.padding.trailing == 0)
        #expect(viewModel.action == nil)
    }
}
