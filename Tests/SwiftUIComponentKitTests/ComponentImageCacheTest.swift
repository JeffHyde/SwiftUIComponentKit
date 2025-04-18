import Testing
import SwiftUI
@testable import SwiftUIComponentKit

struct ImageCacheTest {
    let cache = ComponentImageCache()
    let imageUrlString1 = "https://example1.com"
    let imageUrlString2 = "https://example2.com"
    
    @Test func images_did_cache() async throws {
        guard let image = UIImage(systemName: "trash")  else {
            #expect(Bool(false))
            return
        }
        cache.cacheImage(image: image, urlStringKey: imageUrlString1)
        cache.cacheImage(image: image, urlStringKey: imageUrlString2)
        
        let savedImage1 = cache.image(urlStringKey: imageUrlString1)
        let savedImage2 = cache.image(urlStringKey: imageUrlString2)
        
        #expect(savedImage1 != nil)
        #expect(savedImage2 != nil)
    }
    
    @Test func did_remove_image_from_cache() async throws {
        cache.removeImage(urlStringKey: imageUrlString1)
        #expect(cache.image(urlStringKey: imageUrlString1) == nil)
    }
    
    @Test func cache_did_clear() async throws {
        cache.clearCache()
        #expect(cache.image(urlStringKey: imageUrlString2) == nil)
    }
}
