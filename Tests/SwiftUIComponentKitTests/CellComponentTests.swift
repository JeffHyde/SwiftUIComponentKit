import Testing
@testable import SwiftUIComponentKit

struct CellComponentTests {
    @Test func init_with_default() async throws {
        let textViewModel = TextComponentViewModel(textType: .standard("Hello World"))
        let viewModel = CellComponentViewModel(topTextViewModel: textViewModel)
        
        #expect(viewModel.topTextViewModel == textViewModel)
        #expect(viewModel.middleTextViewModel == nil)
        #expect(viewModel.bottomTextViewModel == nil)
        #expect(viewModel.leadingImageViewModel == nil)
        #expect(viewModel.trailingImageViewModel == nil)
        #expect(viewModel.leadingImageAlignment == .center)
        #expect(viewModel.backgroundColor == .clear)
        #expect(viewModel.borderColor == .clear)
        #expect(viewModel.cornerRadius == .none)
        #expect(viewModel.borderWidth == .none)
        #expect(viewModel.shadowRadius == .none)
        #expect(viewModel.action == nil)
    }
}
