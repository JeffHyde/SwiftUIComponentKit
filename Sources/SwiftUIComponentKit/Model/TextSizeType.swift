import Foundation

public enum TextSizeType {
    case width(Double),
         height(Double),
         widthAndHeight(width: Double, height: Double),
         flexable
}
