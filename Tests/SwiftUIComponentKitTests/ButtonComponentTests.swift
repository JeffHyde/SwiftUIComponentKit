import Testing
@testable import SwiftUIComponentKit

struct ButtonComponentTests {
    @Test func init_with_default() async throws {
        let component = ViewComponent.text(viewModel: TextComponentViewModel(textType: .standard("Hello World!")))
        let viewModel = ButtonComponentViewModel(labelComponent: component)
        
        #expect(viewModel.labelComponent == component)
        #expect(viewModel.padding.top == .none)
        #expect(viewModel.padding.bottom == .none)
        #expect(viewModel.padding.leading == .none)
        #expect(viewModel.padding.trailing == .none)
        #expect(viewModel.action == nil)
    }
}
