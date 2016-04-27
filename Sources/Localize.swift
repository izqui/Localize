import Foundation

private extension String {
    var snakeCaseString: String {
        return stringByReplacingOccurrencesOfString("([a-z])([A-Z])", withString: "$1-$2", options: NSStringCompareOptions.RegularExpressionSearch, range: startIndex..<endIndex)
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
        return NSBundle.mainBundle().localizedStringForKey(self.dynamicType.entityName + stringSeparator + rawValue.lowercaseString, value: nil, table: nil)
    }
}

private extension Localizable {
    static var entityName: String {
        let name = String(self).lowercaseString
        
        guard let parentName = parent?.entityName else { return name }
        
        return parentName + stringSeparator + name
    }
}

