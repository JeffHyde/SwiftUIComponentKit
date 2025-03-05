import SwiftUI

public extension PaddingModel {
    /// PaddingModel(top: value, leading: value, bottom: value, trailing: value)
    static func all(_ value: Double) -> PaddingModel {
        return PaddingModel(top: value, leading: value, bottom: value, trailing: value)
    }
    
    /// PaddingModel(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    static func all(_ vertical: Double, _ horizontal: Double) -> PaddingModel {
        return PaddingModel(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }
    
    /// PaddingModel(top: value, leading: .extraLarge, bottom: value, trailing: .none)
    static func vertical(_ value: Double) -> PaddingModel {
        return PaddingModel(top: value, leading: .none, bottom: value, trailing: .none)
    }
    
    /// PaddingModel(top: .none, leading: value, bottom: .none, trailing: value)
    static func horizontal(_ value: Double) -> PaddingModel {
        return PaddingModel(top: .none, leading: value, bottom: .none, trailing: value)
    }
    
    /// PaddingModel(top: value, leading: .none, bottom: .none, trailing: .none)
    static func top(_ value: Double) -> PaddingModel {
        return PaddingModel(top: value, leading: .none, bottom: .none, trailing: .none)
    }
    
    /// PaddingModel(top: .none, leading: .none, bottom: value, trailing: .none)
    static func bottom(_ value: Double) -> PaddingModel {
        return PaddingModel(top: .none, leading: .none, bottom: value, trailing: .none)
    }
    
    /// PaddingModel(top: .none, leading: value, bottom: .none, trailing: .none)
    static func leading(_ value: Double) -> PaddingModel {
        return PaddingModel(top: .none, leading: value, bottom: .none, trailing: .none)
    }
    
    /// PaddingModel(top: .none, leading: .none, bottom: .none, trailing: value)
    static func trailing(_ value: Double) -> PaddingModel {
        return PaddingModel(top: .none, leading: .none, bottom: .none, trailing: value)
    }
    
    /// PaddingModel(top: value, leading: value, bottom: .none, trailing: .none)
    static func topLeading(_ value: Double) -> PaddingModel {
        return PaddingModel(top: value, leading: value, bottom: .none, trailing: .none)
    }
    
    /// PaddingModel(top: value, leading: .none, bottom: .none, trailing: value)
    static func topTrailing(_ value: Double) -> PaddingModel {
        return PaddingModel(top: value, leading: .none, bottom: .none, trailing: value)
    }
    
    /// PaddingModel(top: .none, leading: value, bottom: value, trailing: .none)
    static func bottomLeading(_ value: Double) -> PaddingModel {
        return PaddingModel(top: .none, leading: value, bottom: value, trailing: .none)
    }
    
    /// PaddingModel(top: .none, leading: .none, bottom: value, trailing: value)
    static func bottomTrailing(_ value: Double) -> PaddingModel {
        return PaddingModel(top: .none, leading: .none, bottom: value, trailing: value)
    }
}
