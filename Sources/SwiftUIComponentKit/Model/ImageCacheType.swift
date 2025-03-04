import Foundation

/// The type of cache use for image components
public enum ImageCacheType {
    case none
    case custom(ImageCacheable)
}
