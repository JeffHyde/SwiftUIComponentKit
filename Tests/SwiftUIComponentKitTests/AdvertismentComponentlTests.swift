import Testing
@testable import SwiftUIComponentKit

struct AdvertismentComponentlTests {
    @Test func init_with_default() async throws {
        let textViewModel = TextComponentViewModel(textType: .standard("Hello World"))
        let viewModel = AdvertismentComponentViewModel(leadingTopTextViewModel: textViewModel)
        
        #expect(viewModel.leadingTopTextViewModel == textViewModel)
        #expect(viewModel.leadingCenterTextViewModel == nil)
        #expect(viewModel.leadingBottomTextViewModel == nil)
        #expect(viewModel.trailingTopTextViewModel == nil)
        #expect(viewModel.trailingCenterTextViewModel == nil)
        #expect(viewModel.trailingBottomTextViewModel == nil)
        #expect(viewModel.imageViewModel == nil)        
        #expect(viewModel.imagePlacment == .center)
        #expect(viewModel.backgroundColor == .clear)
        #expect(viewModel.borderColor == .clear)
        #expect(viewModel.borderWidth == .none)
        #expect(viewModel.cornerRadius == .none)
        #expect(viewModel.shadowRadius == .none)
        #expect(viewModel.innerPadding.top == .none)
        #expect(viewModel.innerPadding.bottom == .none)
        #expect(viewModel.innerPadding.leading == .none)
        #expect(viewModel.innerPadding.trailing == .none)
        #expect(viewModel.outerPadding.top == .none)
        #expect(viewModel.outerPadding.bottom == .none)
        #expect(viewModel.outerPadding.leading == .none)
        #expect(viewModel.outerPadding.trailing == .none)
        #expect(viewModel.action == nil)
    }
}
