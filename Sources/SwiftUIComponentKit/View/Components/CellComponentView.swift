import SwiftUI

struct CellComponentView: View {
    @ObservedObject var viewModel: CellComponentViewModel
    
    var body: some View {
        HStack(spacing: .zero) {
            HStack(alignment: viewModel.leadingImageAlignment, spacing: .zero) {
                if let leadingImageViewModel = viewModel.leadingImageViewModel {
                    ComponentView(
                        viewComponent: .image(
                            viewModel: leadingImageViewModel
                        )
                    )
                }
                
                VStack(spacing: .zero) {
                    ComponentView(
                        viewComponent: .text(
                            viewModel: viewModel.topTextViewModel
                        )
                    )
                    
                    if let subtitleViewModel = viewModel.middleTextViewModel {
                        ComponentView(
                            viewComponent: .text(
                                viewModel: subtitleViewModel
                            )
                        )
                    }
                    
                    if let captionViewModel = viewModel.bottomTextViewModel {
                        ComponentView(
                            viewComponent: .text(
                                viewModel: captionViewModel
                            )
                        )
                    }
                }
            }
            
            if let trailingImageViewModel = viewModel.trailingImageViewModel {
                ComponentView(
                    viewComponent: .image(
                        viewModel: trailingImageViewModel
                    )
                )
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: viewModel.cornerRadius))
        .background(
            RoundedRectangle(cornerRadius: viewModel.cornerRadius)
                .foregroundStyle(viewModel.backgroundColor)
                .shadow(
                    radius: viewModel.shadowRadius,
                    x: 0,
                    y: viewModel.shadowRadius
                )
        )
        .overlay(
            RoundedRectangle(cornerRadius: viewModel.cornerRadius)
                .stroke(
                    viewModel.borderColor,
                    lineWidth: viewModel.borderWidth
                )
        )
        .onTapModifier(
            id: viewModel.id,
            onTap: viewModel.action
        )
        .navigatable(viewModel.navigationDestination)
        .padding(
            EdgeInsets(
                top: viewModel.padding.top,
                leading: viewModel.padding.leading,
                bottom: viewModel.padding.bottom,
                trailing: viewModel.padding.trailing
            )
        )
    }
}

#Preview {
    VStack {
        CellComponentView(
            viewModel: CellComponentViewModel(
                topTextViewModel: TextComponentViewModel(
                    textType: .standard("Hello"),
                    font: .title3.bold(),
                    textAlignment: .leading,
                    horizontalAlignment: .leading,
                    outerPadding: .all(8, 4)
                ),
                middleTextViewModel: TextComponentViewModel(
                    textType: .standard("Hello"),
                    font: .body,
                    textAlignment: .leading,
                    horizontalAlignment: .leading,
                    outerPadding: .all(2, 4)
                ),
                bottomTextViewModel: TextComponentViewModel(
                    textType: .standard("Hello"),
                    font: .caption.italic(),
                    textAlignment: .leading,
                    horizontalAlignment: .leading,
                    outerPadding: .all(2, 4)
                ),
                leadingImageViewModel:
                    ImageComponentViewModel(
                        type: .async(
                            url: URL(string: "https://picsum.photos/id/10/2500/1667"),
                            placeHolder: "person"
                        ),
                        backgroundColor: Color(uiColor: .lightGray),
                        borderColor: .primary,
                        borderWidth: 2,
                        outerCornerRadius: 22,
                        width: 44,
                        height: 44,
                        outerPadding: .all(0)
                    ),
                trailingImageViewModel: ImageComponentViewModel(
                    type: .system(name: "chevron.right", scale: .large),
                    outerPadding:  .all(4)
                ),
                leadingImageAlignment: .top,
                backgroundColor:  Color(uiColor: UIColor(red: 230/255, green: 250/255, blue: 250/255, alpha: 1)),
                borderColor: .primary,
                cornerRadius: 4,
                borderWidth: 0.5,
                shadowRadius: 3,
                action: { id in print("Cell Tapped") }
            )
        )
        
        CellComponentView(
            viewModel: CellComponentViewModel(
                topTextViewModel: TextComponentViewModel(
                    textType: .standard("Hello"),
                    font: .title3.bold(),
                    textAlignment: .leading,
                    horizontalAlignment: .leading,
                    outerPadding: .all(8, 4)
                ),
                middleTextViewModel: TextComponentViewModel(
                    textType: .standard("Hello"),
                    font: .body,
                    textAlignment: .leading,
                    horizontalAlignment: .leading,
                    outerPadding: .all(2, 4)
                ),
                bottomTextViewModel: TextComponentViewModel(
                    textType: .standard("Hello"),
                    font: .caption.italic(),
                    textAlignment: .leading,
                    horizontalAlignment: .leading,
                    outerPadding: .all(2, 4)
                ),
                leadingImageViewModel:
                    ImageComponentViewModel(
                        type: .async(
                            url: URL(string: "https://picsum.photos/id/10/2500/1667"),
                            placeHolder: "person"
                        ),
                        backgroundColor: Color(uiColor: .lightGray),
                        borderColor: .primary,
                        borderWidth: 2,
                        outerCornerRadius: 22,
                        width: 44,
                        height: 44,
                        outerPadding: .all(0)
                    ),
                trailingImageViewModel: ImageComponentViewModel(
                    type: .system(name: "chevron.right", scale: .large),
                    outerPadding:  .all(4)
                ),
                leadingImageAlignment: .top,
                backgroundColor:  Color(uiColor: UIColor(red: 230/255, green: 250/255, blue: 250/255, alpha: 1)),
                borderColor: .primary,
                cornerRadius: 4,
                borderWidth: 0.5,
                shadowRadius: 3,
                action: { _ in print("Cell Tapped") }
            )
        )
    }
}
