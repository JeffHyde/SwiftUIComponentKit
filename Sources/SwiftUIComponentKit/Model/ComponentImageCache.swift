import SwiftUI

public class ComponentImageCache: ImageCacheable, @unchecked Sendable {
    /// The NSCache for storing images
    private let cache = NSCache<NSString, UIImage>()
    
    /// The operation queue
    private let cacheQueue = DispatchQueue(label: "imagecache_queue", attributes: .concurrent)
    
    /// The Image stored in the cache from a URL key
    /// - Parameter urlString: The URL String Key
    /// - Returns:The stored UIImage?
    public func cachedImage(urlString: String) -> UIImage? {
        cacheQueue.sync {
            return cache.object(forKey: urlString as NSString)
        }
    }
    
    /// Caches the given image, barriers the async operation to prevent race conditions
    /// - Parameters:
    ///   - image: UIImage
    ///   - urlString: URL String Key
    public func cacheImage(image: UIImage, urlString: String) {
        cacheQueue.async(flags: .barrier) {
            self.cache.setObject(image, forKey: urlString as NSString)
        }
    }

    /// Removing all objects, barriers the async operation to prevent race conditions
    public func clearCache() {
        cacheQueue.async(flags: .barrier) {
            self.cache.removeAllObjects()
        }
    }
}
