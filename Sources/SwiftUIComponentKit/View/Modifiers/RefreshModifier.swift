import SwiftUI

struct RefreshModifier: ViewModifier {
    let refreshable: Bool
    let action: () -> ()
    
    func body(
        content: Content
    ) -> some View {
        if refreshable {
            content.refreshable {
                action()
            }
        } else {
            content
        }
    }
}
