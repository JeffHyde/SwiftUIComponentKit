import SwiftUI

extension View {
    /// `VerticallyAlignedModifier`
    func verticallyAligned(_ alignment: VerticalAlignment? = .center) -> some View {
        modifier(VerticallyAlignedModifier(alignment: alignment))
    }
    
    /// `HorizontallyAlignedModifier`
    func horizontallyAligned(_ alignment: HorizontalAlignment? = .center) -> some View {
        modifier(HorizontallyAlignedModifier(alignment: alignment))
    }
    
    /// `OnTapModifier`
    func onTapModifier(id: String, onTap: ((String) -> ())?) -> some View {
        modifier(OnTapModifier(id: id, onTap: onTap))
    }
    
    /// `PickerStyleModifier`
    func pickerType(_ type: PickerType) -> some View {
        modifier(PickerStyleModifier(type: type))
    }
    
    /// `TextSizeModifier`
    func textSize(_ type: TextSizeType) -> some View {
        modifier(TextSizeModifier(sizeType: type))
    }
    
    /// `ImageModifier`
    func imageModifier(_ viewModel: ImageComponentViewModel) -> some View {
        modifier(ImageModifier(viewModel: viewModel))
    }
    
    /// `FrameModifier`
    func framed(_ displayType: DisplayType = .horizontal, size: CGFloat) -> some View {
        modifier(FrameModifier(displayType: displayType, size: size))
    }
    
    /// `RefreshModifier`
    func refresh(refreshable: Bool, action: @escaping () -> ()) -> some View {
        modifier(RefreshModifier(refreshable: refreshable, action: action))
    }
}
