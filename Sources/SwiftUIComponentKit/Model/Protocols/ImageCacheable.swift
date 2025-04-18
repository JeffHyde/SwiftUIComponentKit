import SwiftUI
import UIKit

/// A protocol that defines an image caching mechanism.
/// Conforming types should provide the caching system to store and retrieve images efficiently.
public protocol ImageCacheable {
    /// The NSCache<NSString, UIImage> whic contains the stoired images
    var cache: NSCache<NSString, UIImage> { get set }
    
    /// Caches an image for a specific URL string.
    ///
    /// - Parameters:
    ///   - image: The `UIImage`  instance to be cached.
    ///   - urlStringKey: The URL string to associate with the cached image.
    func cacheImage(image: UIImage, urlStringKey: String)
    
    /// Retrieves a cached image for a given URL string.
    ///
    /// - Parameter urlStringKey: The URL string associated with the cached image.
    /// - Returns: The cached `UIImage` if available, otherwise `nil`.
    func image(urlStringKey: String) -> UIImage?
    
    /// Removes an image from the cache
    /// - Parameter urlStringKey: The URL string to associate with the cached image.
    func removeImage(urlStringKey: String)
    
    /// Clears all stored images from the cache.
    func clearCache()
}
