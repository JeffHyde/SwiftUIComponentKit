import Testing
import SwiftUI
@testable import SwiftUIComponentKit

struct ImageComponentTests {
    @Test func init_with_default() async throws {
        let viewModel = ImageComponentViewModel()
        if case .system(name: "trash", scale: .large) = viewModel.type {
            #expect(true)
        } else {
            #expect(Bool(false))
        }
        
        if case .fit = viewModel.contentMode {
            #expect(true)
        } else {
            #expect(Bool(false))
        }
        
        #expect(viewModel.backgroundColor == .clear)
        #expect(viewModel.borderColor == .clear)
        #expect(viewModel.borderWidth == 0)
        #expect(viewModel.innerCornerRadius == 0)
        #expect(viewModel.outerCornerRadius == 0)
        #expect(viewModel.width == nil)
        #expect(viewModel.height == nil)
        #expect(viewModel.progressSize == 44)
        #expect(viewModel.animationDuration == 1)
        
        #expect(viewModel.innerPadding.top == 0)
        #expect(viewModel.innerPadding.bottom == 0)
        #expect(viewModel.innerPadding.leading == 0)
        #expect(viewModel.innerPadding.trailing == 0)
        #expect(viewModel.outerPadding.top == 0)
        #expect(viewModel.outerPadding.bottom == 0)
        #expect(viewModel.outerPadding.leading == 0)
        #expect(viewModel.outerPadding.trailing == 0)
        
        #expect(viewModel.cache == nil)
        #expect(viewModel.onTap == nil)
        
        #expect(viewModel.loaded == false)
        #expect(viewModel.error == nil)
    }
    
    @Test func test_asyncImage_did_cache() async throws {
        let viewModel = ImageComponentViewModel(
            type: .async(url: URL(string: "https://www.google.com"), placeHolder: ""),
            cache: MockImageCache()
        )
        
        viewModel.success(image: Image(systemName: "trash"))
        try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
        
        #expect(viewModel.error == nil)
        #expect(viewModel.cachedImage() != nil)
    }
    
    @Test func test_asyncImage_failed_to_cache() async throws {
        let viewModel = ImageComponentViewModel(
            type: .async(url: URL(string: "invalid"), placeHolder: ""),
            cache: MockImageCache()
        )
        let error = URLError(.unknown)
        
        viewModel.failed(error)
        try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
        
        #expect(viewModel.error as? URLError == error)
        #expect(viewModel.cachedImage() == nil)
    }
    
    @Test func test_asyncImage_failed_to_cache_on_success() async throws {
        let viewModel = ImageComponentViewModel(
            type: .async(url: URL(string: "invalid"), placeHolder: "trash"),
            cache: MockImageCache()
        )
        
        viewModel.success(image: Image(systemName: "trash"))
        try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
        
        #expect(viewModel.cachedImage() == nil)
    }
    
    @Test func test_systemImage_did_not_cache() async throws {
        let viewModel = ImageComponentViewModel(
            type: .system(name: "trash", scale: .small),
            cache: MockImageCache()
        )
        
        viewModel.success(image: Image(systemName: "trash"))
        try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
        
        #expect(viewModel.cachedImage() == nil)
    }
    
    struct MockImageCache: ImageCacheable {
        var cache = NSCache<NSString, UIImage>()
        func cachedImage(urlString: String) -> UIImage? {
            cache.object(forKey: NSString(string: urlString))
        }
        
        func cacheImage(image: Image, urlString: String) {
            guard let uiImage = UIImage(systemName: "trash") else { return }
            cache.setObject(uiImage, forKey: urlString as NSString)
        }
        
        func clearCache() {
            cache.removeAllObjects()
        }
    }
}
