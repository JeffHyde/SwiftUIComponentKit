import Testing
import SwiftUI
@testable import SwiftUIComponentKit

struct SliderComponentTests {
    @Test func init_with_default() async throws {
        let viewModel = SliderComponentViewModel()
        
        #expect(viewModel.value == 0.0)
        #expect(viewModel.range == 0.0...100.0)
        #expect(viewModel.padding.top == .none)
        #expect(viewModel.padding.bottom == .none)
        #expect(viewModel.padding.leading == .none)
        #expect(viewModel.padding.trailing == .none)
        #expect(viewModel.tapCount == 1)
        #expect(viewModel.tapType == .none)
    }
    
    @Test func init_with_pointConversion() async throws {
        let viewModel = SliderComponentViewModel(tapType: .pointConversion)
        #expect(viewModel.tapType == .pointConversion)
    }
    
    @Test func init_with_custom() async throws {
        let tapType: SliderTapType = .custom(id: "0") { id in }
        let viewModel = SliderComponentViewModel(tapType: tapType)
        #expect(viewModel.tapType == tapType)
    }
    
    @Test func tap_did_convertToPoint() async throws {
        let viewModel = SliderComponentViewModel(tapType: .pointConversion)
        let tapPoint: CGFloat = 75
        let tolerance: CGFloat = 0.01
        
        viewModel.handleTapConversion(CGPoint(x: tapPoint, y: 0), 100)
        try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
        
        #expect(viewModel.value < (tapPoint + tolerance) && viewModel.value > (tapPoint - tolerance))
    }
}
