import SwiftUI

public enum ImageType {
    case async(url: URL?, placeHolder: String)
    case system(name: String, scale: Image.Scale)
    case custom(name: String)
}
