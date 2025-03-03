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
                                    viewModel.success(image: image)
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
    VStack {
        HStack {
            ImageComponentView(
                viewModel:
                    ImageComponentViewModel(
                    type: .async(
                        url:  URL(string:
                                    "https://vettestripes.com/wp-content/uploads/SmartSelect_20231213_113820_Instagram.jpg"),
                        placeHolder: "trash"
                    ),
                    backgroundColor: .green,
                    innerCornerRadius: 0,
                    outerCornerRadius: 0,
                    innerPadding: .all(0),
                    outerPadding: .all(0)
                )
            )
            Text("HELLO").padding(10)
        }
        ImageComponentView(
            viewModel: ImageComponentViewModel(
                type: .system(name: "person", scale: .large),
                backgroundColor: .yellow,
                borderColor: .black,
                borderWidth: 6,
                outerCornerRadius: 50,
                width: 100,
                height: 100,
                outerPadding: .all(24)
            )
        )
        
        ImageComponentView(
            viewModel: ImageComponentViewModel(
                type: .custom(name: "Sample"),
                outerPadding: .all(24)
            )
        )
    }
}

