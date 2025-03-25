import SwiftUI

open class ImageComponentViewModel: ComponentViewModel {
    @Published public var type: ImageType
    @Published public var contentMode: ContentMode
    @Published public var backgroundColor: Color
    @Published public var borderColor: Color
    @Published public var borderWidth: Double
    @Published public var innerCornerRadius: Double
    @Published public var outerCornerRadius: Double
    @Published public var width: CGFloat?
    @Published public var height: CGFloat?
    @Published public var progressSize: CGFloat?
    @Published public var animationDuration: Double
    @Published public var innerPadding: PaddingModel
    @Published public var outerPadding: PaddingModel
    public var imageCache: ImageCacheType
    public var cache: ImageCacheable? = nil
    public var action: ((String) -> ())?
    
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
        action: ((String) -> ())? = nil
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
        self.action = action
        
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
            return cache?.image(urlStringKey: url.absoluteString)
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
            cache?.cacheImage(image: image, urlStringKey: url.absoluteString)
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
