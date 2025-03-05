import Foundation

/// Style for a ``ProgressView``.
public enum ProgressStyle {
    case bar(title: String, progress: Double, total: Double)
    case wheel
}
