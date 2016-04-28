import Foundation

private extension String {
    var snakeCaseString: String {
        return stringByReplacingOccurrencesOfString("([a-z])([A-Z])", withString: "$1-$2", options: .RegularExpressionSearch, range: startIndex..<endIndex)
            .stringByReplacingCharactersInRange(startIndex...startIndex, withString: String(self[startIndex]))
            .lowercaseString
    }
}

private let stringSeparator: String = "."

public protocol Localizable {
    static var parent: LocalizeParent { get }
    var rawValue: String { get }
}

public typealias LocalizeParent = Localizable.Type?

public extension Localizable {
    var localized: String {
        return NSBundle.mainBundle().localizedStringForKey(localizableKey, value: nil, table: nil)
    }
    
    var description: String {
        return localizableKey
    }
}

private extension Localizable {
    static func concatComponent(parent parent: String?, child: String) -> String {
        guard let p = parent else { return child.snakeCaseString }
        return p + stringSeparator + child.snakeCaseString
    }
    
    static var entityName: String {
        return concatComponent(parent: parent?.entityName, child: String(self))
    }
    
    var localizableKey: String {
        return self.dynamicType.concatComponent(parent: self.dynamicType.entityName, child: rawValue)
    }
}
