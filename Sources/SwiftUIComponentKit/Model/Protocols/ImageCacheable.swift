import SwiftUI
import UIKit

/// A protocol that defines an image caching mechanism.
/// Conforming types should provide a caching system to store and retrieve images efficiently.
public protocol ImageCacheable {
//    var cache: NSCache<NSString, UIImage> { get set }
    /// Retrieves a cached image for a given URL string.
    ///
    /// - Parameter urlString: The URL string associated with the cached image.
    /// - Returns: The cached `UIImage` if available, otherwise `nil`.
    func cachedImage(urlString: String) -> UIImage?
    
    /// Caches an image for a specific URL string.
    ///
    /// - Parameters:
    ///   - image: The `Image` (SwiftUI) instance to be cached.
    ///   - urlString: The URL string to associate with the cached image.
    ///
    /// This method is responsible for converting the `Image` (SwiftUI) to `UIImage`
    /// before storing it in the cache.
    func cacheImage(image: UIImage, urlString: String)
    
    /// Clears all stored images from the cache.
    ///
    /// This method removes all cached images.
    func clearCache()
}
