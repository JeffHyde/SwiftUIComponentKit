import SwiftUI

extension TextInputAutocapitalization: @retroactive Equatable {
    public static func == (lhs: TextInputAutocapitalization, rhs: TextInputAutocapitalization) -> Bool {
        String(describing: lhs) == String(describing: rhs)
    }
}
