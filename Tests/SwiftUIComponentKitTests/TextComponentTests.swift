import Testing
@testable import SwiftUIComponentKit

struct TextComponentTests {
    @Test func init_with_default() async throws {
        let text = "Hello World!"
        let viewModel = TextComponentViewModel(textType: .standard(text))
        
        if case .standard(text) = viewModel.textType {
            #expect(true)
        } else {
            #expect(Bool(false))
        }
        
        #expect(viewModel.font == .body)
        #expect(viewModel.textAlignment == .center)
        #expect(viewModel.horizontalAlignment == nil)
        #expect(viewModel.foregroundColor == .primary)
        #expect(viewModel.backgroundColor == .clear)
        #expect(viewModel.borderColor == .clear)
        #expect(viewModel.borderWidth == .none)
        #expect(viewModel.cornerRadius == .none)
        
        if case .flexible = viewModel.sizeType {
            #expect(true)
        } else {
            #expect(Bool(false))
        }
        
        #expect(viewModel.innerPadding.top == .none)
        #expect(viewModel.innerPadding.bottom == .none)
        #expect(viewModel.innerPadding.leading == .none)
        #expect(viewModel.innerPadding.trailing == .none)
        #expect(viewModel.outerPadding.top == .none)
        #expect(viewModel.outerPadding.bottom == .none)
        #expect(viewModel.outerPadding.leading == .none)
        #expect(viewModel.outerPadding.trailing == .none)
        #expect(viewModel.outerBackgroundColor == .clear)
        #expect(viewModel.action == nil)
    }
}
