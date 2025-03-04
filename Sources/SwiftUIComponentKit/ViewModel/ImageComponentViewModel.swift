import SwiftUI

open class ImageComponentViewModel: ComponentViewModel {
    @Published var type: ImageType
    @Published var contentMode: ContentMode
    @Published var backgroundColor: Color
    @Published var borderColor: Color
    @Published var borderWidth: Double
    @Published var innerCornerRadius: Double
    @Published var outerCornerRadius: Double
    @Published var width: CGFloat?
    @Published var height: CGFloat?
    @Published var progressSize: CGFloat?
    @Published var animationDuration: Double
    @Published var innerPadding: PaddingModel
    @Published var outerPadding: PaddingModel
    var imageCache: ImageCacheType
    var cache: ImageCacheable? = nil
    var onTap: ((String) -> ())?
    
    @Published var loaded: Bool = false
    @Published var error: Error? = nil
    
    public init(
        type: ImageType = .system(name: "trash", scale: .large),
        contantMode: ContentMode = .fit,
        backgroundColor: Color = .clear,
        borderColor: Color = .clear,
        borderWidth: Double = .zero,
        innerCornerRadius: Double = .zero,
        outerCornerRadius: Double = .zero,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        progressSize: CGFloat? = 44,
        animationDuration: Double = 1,
        imageCache: ImageCacheType = .none,
        innerPadding: PaddingModel = PaddingModel(),
        outerPadding: PaddingModel = PaddingModel(),
        onTap: ((String) -> ())? = nil
    ) {
        self.type = type
        self.contentMode = contantMode
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.innerCornerRadius = innerCornerRadius
        self.outerCornerRadius = outerCornerRadius
        self.width = width
        self.height = height
        self.progressSize = progressSize
        self.animationDuration = animationDuration
        self.imageCache = imageCache
        self.innerPadding = innerPadding
        self.outerPadding = outerPadding
        self.onTap = onTap
        
        switch imageCache {
        case .none:
            self.cache = nil
        case .custom(let imageCacheable):
            self.cache = imageCacheable
        }
    }
    
    func cachedImage() -> UIImage? {
        switch type {
        case .async(let url, _):
            guard let url, let _ = url.host(), let _ = url.scheme else { return nil }
            return cache?.cachedImage(urlString: url.absoluteString)
        default:
            return nil
        }
    }
    
    func success(image: UIImage) {
        setImageLoaded(image: image)
    }
    
    func failed(_ error: Error) {
        self.error = error
        setLoaded()
    }
    
    private func setImageLoaded(image: UIImage) {
        error = nil
        setLoaded()
        
        switch type {
        case .async(let url, _):
            guard let url, let _ = url.host(), let _ = url.scheme else { return }
            cache?.cacheImage(image: image, urlString: url.absoluteString)
        default:
            break
        }
    }

    private func setLoaded() {
        withAnimation(.easeIn(duration: animationDuration)) {
            loaded = true
        }
    }
}
