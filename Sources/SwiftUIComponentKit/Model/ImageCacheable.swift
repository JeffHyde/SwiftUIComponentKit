import SwiftUI

public protocol ImageCacheable {
    var cache: NSCache<NSString, UIImage> { get set }
    func cachedImage(urlString: String) -> UIImage?
    func cacheImage(image: Image, urlString: String)
    func clearCache()
}
