import Testing
@testable import SwiftUIComponentKit

struct ProgressComponentTests {
    @Test func init_with_default() async throws {
        let viewModel = ProgressComponentViewModel()
       
        if case .wheel = viewModel.style {
            #expect(true)
        } else {
            #expect(Bool(false))
        }
        
        #expect(viewModel.padding.top == 0)
        #expect(viewModel.padding.bottom == 0)
        #expect(viewModel.padding.leading == 0)
        #expect(viewModel.padding.trailing == 0)
        #expect(viewModel.onTap == nil)
    }
}
