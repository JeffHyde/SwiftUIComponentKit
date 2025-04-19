import SwiftUI

/// The type of image to display 
public enum ImageType {
    case async(url: URL?, placeHolder: String)
    
    // Providing a nil scale will resize the system image
    case system(name: String, scale: Image.Scale? = nil)
    
    case custom(name: String)
}
