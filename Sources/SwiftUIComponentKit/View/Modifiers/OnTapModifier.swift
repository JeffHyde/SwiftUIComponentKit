import SwiftUI

struct OnTapModifier: ViewModifier {
    let id: String
    let onTap: ((String) -> ())?
    
    func body(content: Content) -> some View {
        if let onTap {
            content
                .onTapGesture {
                    onTap(id)
                }
        } else {
            content
        }
    }
}
