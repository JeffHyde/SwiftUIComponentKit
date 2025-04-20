import Foundation

/// Style for a ``ProgressView``.
public enum ProgressStyle: Equatable {
    case bar(title: String, progress: Double, total: Double)
    case wheel
    
    public static func == (lhs: ProgressStyle, rhs: ProgressStyle) -> Bool {
        switch (lhs, rhs) {
        case (.bar(let lhsTitle, let lhsProgress, let lhsTotal), .bar(let rhsTitle, let rhsProgress, let rhsTotal)):
            return lhsTitle == rhsTitle && lhsProgress == rhsProgress && lhsTotal == rhsTotal
        case (.wheel, .wheel):
            return true
        default:
            return false
        }
    }
}
