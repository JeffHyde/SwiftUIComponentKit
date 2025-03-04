import SwiftUI

struct ImageComponentView: View {
    @ObservedObject var viewModel: ImageComponentViewModel
    
    var body: some View {
        Group {
            switch viewModel.type {
            case .async(let url, let placeHolder):
                if let cachedImage = viewModel.cachedImage() {
                    ResizedImage(Image(uiImage: cachedImage))
                } else {
                    AsyncImage(
                        url: url,
                        transaction: Transaction.init(animation: .easeInOut)
                    ) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .transition(.opacity)
                                .frame(width: viewModel.progressSize, height: viewModel.progressSize)
                        case .success(let image):
                            ResizedImage(image)
                                .onAppear {
                                    let renderer = ImageRenderer(content: image)
                                    guard let uiImage = renderer.uiImage else { return }
                                    viewModel.success(image: uiImage)
                                }
                        case .failure(let error):
                            ResizedImage(Image(systemName: placeHolder))
                                .onAppear {
                                    viewModel.failed(error)
                                }
                        @unknown default:
                            ResizedImage(Image(systemName: placeHolder))
                                .onAppear {
                                    viewModel.failed(URLError(.unknown))
                                }
                        }
                    }
                }
            case .system(let name, let scale):
                Image(systemName: name)
                    .imageScale(scale)
                    .imageModifier(viewModel)
            case .custom(let name):
                ResizedImage(Image(name))
            }
        }
        .id(viewModel.id)
    }
    
    @ViewBuilder
    private func ResizedImage(_ image: Image) -> some View {
        image
            .resizable()
            .aspectRatio(contentMode: viewModel.contentMode)
            .imageModifier(viewModel)
            .opacity(viewModel.loaded ? 1 : 0)
    }
}

#Preview {
    @Previewable let imageCache = ComponentImageCache()
    
    ScrollView {
        ImageComponentView(
            viewModel: ImageComponentViewModel(
                type: .system(name: "person", scale: .large),
                backgroundColor: .yellow,
                borderColor: .black,
                borderWidth: 6,
                outerCornerRadius: 50,
                width: 100,
                height: 100,
                imageCache: .custom(imageCache),
                outerPadding: .all(24)
            )
        )
        
        VStack {
            ForEach(0..<100, id: \.self) {item in
                ImageComponentView(viewModel: ImageComponentViewModel(
                    type: .async(
                        url:  URL(string:
                                    "https://vettestripes.com/wp-content/uploads/SmartSelect_20231213_113820_Instagram.jpg"),
                        placeHolder: "trash"
                    ),
                    backgroundColor: .gray,
                    borderColor: .red,
                    borderWidth: 8,
                    innerCornerRadius: 100,
                    outerCornerRadius: 50,
                    imageCache: .custom(imageCache),
                    innerPadding: .all(0),
                    outerPadding: .all(0)
                ))
            }

        }
    }
}
