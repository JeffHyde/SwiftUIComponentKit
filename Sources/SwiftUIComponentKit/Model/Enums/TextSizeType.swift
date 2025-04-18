import Foundation

/// The type of size constraints for text
public enum TextSizeType {
    case width(Double),
         height(Double),
         widthAndHeight(width: Double, height: Double),
         flexible
}
