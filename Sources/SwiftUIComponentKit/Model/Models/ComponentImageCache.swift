import SwiftUI

/// The default SwiftUIComponentKit image cache
public class ComponentImageCache: ImageCacheable, @unchecked Sendable {
    /// The NSCache for storing images
    private var cache = NSCache<NSString, UIImage>()
    
    /// The operation queue
    private let cacheQueue: DispatchQueue
    
    /// Creates a ComponentImageCache
    /// - Parameter cacheQueue: The dispatch que to sync on
    /// - Parameter limit: The maximum number of objects the cache should hold
    public init(
        cacheQueue: DispatchQueue = DispatchQueue(label: "imagecache_queue", attributes: .concurrent),
        limit: Int = 100
    ) {
        self.cacheQueue = cacheQueue
        cache.countLimit = limit
    }
    
    /// An Image stored in the cache from a URL key
    /// - Parameter urlString: The URL String Key
    /// - Returns:The stored UIImage?
    public func image(urlStringKey: String) -> UIImage? {
        cacheQueue.sync {
            return cache.object(forKey: NSString(string: urlStringKey))
        }
    }
    
    /// Caches the given image, barriers the async operation to prevent race conditions
    /// - Parameters:
    ///   - image: UIImage
    ///   - urlString: URL String Key
    public func cacheImage(image: UIImage, urlStringKey: String) {
        cacheQueue.async(flags: .barrier) {
            self.cache.setObject(image, forKey: NSString(string: urlStringKey))
        }
    }
    
    /// Removes an image from the cache
    /// - Parameter urlStringKey: The URL string to associate with the cached image.
    public func removeImage(urlStringKey: String) {
        cacheQueue.async(flags: .barrier) {
            self.cache.removeObject(forKey: NSString(string: urlStringKey))
        }
    }
    
    /// Removing all objects, barriers the async operation to prevent race conditions
    public func clearCache() {
        cacheQueue.async(flags: .barrier) {
            self.cache.removeAllObjects()
        }
    }
}
