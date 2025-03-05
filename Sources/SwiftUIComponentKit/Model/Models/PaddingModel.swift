import Foundation

/// The PaddingModel is used to provide padding values(`EdgeInsets`) to a view model in isolation from a view.
///
/// Use the extended values for simplicity
///
///  eg: .all(.large)
public struct PaddingModel {
    let top: Double
    let leading: Double
    let bottom: Double
    let trailing: Double
    
    /// Padding for all directions
    /// - Parameters:
    ///   - top: top padding default = 0
    ///   - leading: leading padding default = 0
    ///   - bottom: bottom padding default = 0
    ///   - trailing: trailing padding default = 0
    public init(
        top: Double = 0.0,
        leading: Double = 0.0,
        bottom: Double = 0.0,
        trailing: Double = 0.0
    ) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
    }
}
