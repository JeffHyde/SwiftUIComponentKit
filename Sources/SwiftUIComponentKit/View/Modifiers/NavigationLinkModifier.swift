import SwiftUI

/// Applies a NavigationLink to the given View
struct NavigationLinkModifier<Destination: View>: ViewModifier {
    let destination: Destination?
    
    func body(content: Content) -> some View {
        if let destination {
            NavigationLink(destination: {
                destination
            }, label: {
                content
            })
        } else {
            content
        }
    }
}
