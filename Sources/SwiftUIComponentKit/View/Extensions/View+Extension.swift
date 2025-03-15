import SwiftUI

extension View {
    /// `VerticallyAlignedModifier`
    func verticallyAligned(_ alignment: Binding<VerticalAlignment?> = .constant(nil)) -> some View {
        modifier(VerticallyAlignedModifier(alignment: alignment))
    }
    
    /// `HorizontallyAlignedModifier`
    func horizontallyAligned(_ alignment: Binding<HorizontalAlignment?> = .constant(nil)) -> some View {
        modifier(HorizontallyAlignedModifier(alignment: alignment))
    }
    
    /// `OnTapModifier`
    func onTapModifier(id: String, onTap: ((String) -> ())?) -> some View {
        modifier(OnTapModifier(id: id, onTap: onTap))
    }
    
    /// `PickerStyleModifier`
    func pickerType(_ type: Binding<PickerType>) -> some View {
        modifier(PickerStyleModifier(type: type))
    }
    
    /// `TextSizeModifier`
    func textSize(_ type: Binding<TextSizeType>) -> some View {
        modifier(TextSizeModifier(sizeType: type))
    }
    
    /// `ImageModifier`
    func imageModifier(_ viewModel: ImageComponentViewModel) -> some View {
        modifier(ImageModifier(viewModel: viewModel))
    }
    
    /// `FrameModifier`
    func framed(_ displayType: Binding<DisplayType> = .constant(.horizontal), size: Binding<CGFloat>) -> some View {
        modifier(FrameModifier(displayType: displayType, size: size))
    }
    
    /// `RefreshModifier`
    func refresh(refreshable: Bool, action: @escaping () -> ()) -> some View {
        modifier(RefreshModifier(refreshable: refreshable, action: action))
    }
    
    /// `NavigationLinkModifier`
    func navigatable<Destination: View>(_ destination: Destination?) -> some View {
        modifier(NavigationLinkModifier(destination: destination))
    }
}
