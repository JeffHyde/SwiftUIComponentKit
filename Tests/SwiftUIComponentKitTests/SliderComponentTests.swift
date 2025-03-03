import Testing
import SwiftUI
@testable import SwiftUIComponentKit

struct SliderComponentTests {
    @Test func init_with_default() async throws {
        let viewModel = SliderComponentViewModel()
        
        #expect(viewModel.value == 0.0)
        #expect(viewModel.range == 0.0...100.0)
        #expect(viewModel.padding.top == 0)
        #expect(viewModel.padding.bottom == 0)
        #expect(viewModel.padding.leading == 0)
        #expect(viewModel.padding.trailing == 0)
        #expect(viewModel.tapCount == 1)
        
        if case .none = viewModel.tapType {
            #expect(true)
        } else {
            #expect(Bool(false))
        }
    }
    
    @Test func init_with_pointConversion() async throws {
        let viewModel = SliderComponentViewModel(tapType: .pointConversion)

        if case .pointConversion = viewModel.tapType {
            #expect(true)
        } else {
            #expect(Bool(false))
        }
    }
    
    @Test func init_with_custom() async throws {
        let viewModel = SliderComponentViewModel(tapType: .custom { id in })

        if case .custom = viewModel.tapType {
            #expect(true)
        } else {
            #expect(Bool(false))
        }
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
