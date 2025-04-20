import SwiftUI

/// The type of image to display 
public enum ImageType: Equatable {
    case async(url: URL?, placeHolder: String)
    
    // Providing a nil scale will resize the system image
    case system(name: String, scale: Image.Scale? = nil)
    
    case custom(name: String)
    
    public static func == (lhs: ImageType, rhs: ImageType) -> Bool {
        switch (lhs, rhs) {
        case (.async(let urlA, let placeA), .async(let urlB, let placeB)):
            return urlA == urlB && placeA == placeB
        case (.system(let nameA, let scaleA), .system(let nameB, let scaleB)):
            return nameA == nameB && scaleA == scaleB
        case (.custom(let nameA), .custom(let nameB)):
            return nameA == nameB
        default:
            return false
        }
    }
}
