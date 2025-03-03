import SwiftUI

open class ComponentViewModel: ObservableObject, Identifiable, Hashable {
    @Published public var id: String
    
    public init(id: String = UUID().uuidString) {
        self.id = id
    }
    
    public static func == (lhs: ComponentViewModel, rhs: ComponentViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
