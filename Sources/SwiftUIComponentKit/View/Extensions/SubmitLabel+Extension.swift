import SwiftUI

extension SubmitLabel {
    public static func == (lhs: SubmitLabel, rhs: SubmitLabel) -> Bool {
        String(describing: lhs) == String(describing: rhs)
    }
}
