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
        
        if case .none = viewModel.imageCache {
            #expect(true)
        } else {
            #expect(Bool(false))
        }
        
        #expect(viewModel.cache == nil)
        #expect(viewModel.innerPadding.top == 0)
        #expect(viewModel.innerPadding.bottom == 0)
        #expect(viewModel.innerPadding.leading == 0)
        #expect(viewModel.innerPadding.trailing == 0)
        #expect(viewModel.outerPadding.top == 0)
        #expect(viewModel.outerPadding.bottom == 0)
        #expect(viewModel.outerPadding.leading == 0)
        #expect(viewModel.outerPadding.trailing == 0)
        
        #expect(viewModel.loaded == false)
        #expect(viewModel.error == nil)
    }
    
    @Test func test_asyncImage_did_cache() async throws {
        let viewModel = ImageComponentViewModel(
            type: .async(url: URL(string: "https://www.google.com"), placeHolder: ""),
            imageCache: .custom(ComponentImageCache())
        )
        
        if let image = UIImage(systemName: "trash") {
            viewModel.success(image: image)
            try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
            
            #expect(viewModel.error == nil)
            #expect(viewModel.cachedImage() != nil)
        } else {
            #expect(Bool(false))
        }
    }
    
    @Test func test_asyncImage_failed_to_cache() async throws {
        let viewModel = ImageComponentViewModel(
            type: .async(url: URL(string: "invalid"), placeHolder: ""),
            imageCache: .custom(ComponentImageCache())
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
            imageCache: .custom(ComponentImageCache())
        )
        if let image = UIImage(systemName: "trash") {
            viewModel.success(image: image)
            try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
            
            #expect(viewModel.cachedImage() == nil)
        } else {
            #expect(Bool(false))
        }
    }
    
    @Test func test_systemImage_did_not_cache() async throws {
        let viewModel = ImageComponentViewModel(
            type: .system(name: "trash", scale: .small),
            imageCache: .custom(ComponentImageCache())
        )
        
        if let image = UIImage(systemName: "trash") {
            viewModel.success(image: image)
            try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
            
            #expect(viewModel.cachedImage() == nil)
        } else {
            #expect(Bool(false))
        }
    }
    
    @Test func test_cache_did_clear() async throws {
        let cache = ComponentImageCache()
        let viewModel = ImageComponentViewModel(
            type: .async(url: URL(string: "https://www.google.com"), placeHolder: ""),
            imageCache: .custom(cache)
        )
        
        if let image = UIImage(systemName: "trash") {
            viewModel.success(image: image)
            try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
            cache.clearCache()
            try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
            
            #expect(viewModel.error == nil)
            #expect(viewModel.cachedImage() == nil)
        } else {
            #expect(Bool(false))
        }
    }
}
