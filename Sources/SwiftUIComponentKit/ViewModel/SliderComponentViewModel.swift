import SwiftUI
import Combine

open class SliderComponentViewModel: ComponentViewModel {
    @Published public var value: Double
    @Published public var range: ClosedRange<Double>
    @Published public var padding: PaddingModel
    @Published public var tapCount: Int
    public var tapType: SliderTapType
    private let tapSubject = PassthroughSubject<(CGPoint, CGFloat), Never>()
    private var cancellables: Set<AnyCancellable> = Set()

    public init(
        value: Double = 0.0,
        range: ClosedRange<Double> = 0.0...100.0,
        padding: PaddingModel = PaddingModel(),
        tapCount: Int = 1,
        tapType: SliderTapType = .none
    ) {
        self.value = value
        self.range = range
        self.padding = padding
        self.tapCount = tapCount
        self.tapType = tapType
        
        super.init()
        
        if case .pointConversion = tapType {
            self.updateValueForPointConversion()
        }
    }
    
    func handleTapConversion(_ point: CGPoint, _ width: CGFloat) {
        tapSubject.send((point, width))
    }
    
    private func updateValueForPointConversion() {
        tapSubject
            .map { [weak self] point, width in
                guard let converion = self?.convertPointToRange(point, width) else {
                    return .zero
                }
                return converion
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                self?.value = value
            }
            .store(in: &cancellables)
    }

    private func convertPointToRange(_ point: CGPoint, _ width: CGFloat) -> Double {
        let adjustedX = point.x - padding.leading
        let clampedX = max(0, min(adjustedX, width))
        
        let mappedValue = range.lowerBound +
        (clampedX / width) *
        (range.upperBound - range.lowerBound)
        
        return mappedValue
    }
}
