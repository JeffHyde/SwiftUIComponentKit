import SwiftUI

struct TextSizeModifier: ViewModifier {
    @Binding var sizeType: TextSizeType
    
    func body(content: Content) -> some View {
        switch sizeType {
        case .width(let width):
            content.frame(width: width)
        case .height(let height):
            content.frame(height: height)
        case .widthAndHeight(let width, let height):
            content.frame(width: width, height: height)
        case .flexable:
            content
        }
    }
}
