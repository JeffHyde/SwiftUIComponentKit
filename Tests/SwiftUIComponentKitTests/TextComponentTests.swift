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
        #expect(viewModel.borderWidth == 0)
        #expect(viewModel.cornerRadius == 0)
        
        if case .flexible = viewModel.sizeType {
            #expect(true)
        } else {
            #expect(Bool(false))
        }
        
        #expect(viewModel.innerPadding.top == 0)
        #expect(viewModel.innerPadding.bottom == 0)
        #expect(viewModel.innerPadding.leading == 0)
        #expect(viewModel.innerPadding.trailing == 0)
        #expect(viewModel.outerPadding.top == 0)
        #expect(viewModel.outerPadding.bottom == 0)
        #expect(viewModel.outerPadding.leading == 0)
        #expect(viewModel.outerPadding.trailing == 0)
        #expect(viewModel.outerBackgroundColor == .clear)
        #expect(viewModel.action == nil)
    }
}
