//
//  ExampleStrings.swift
//  example
//
//  Created by Jorge Izquierdo on 4/28/16.
//  Copyright © 2016 Jorge Izquierdo. All rights reserved.
//

typealias AppStrings = Example

enum Example: String, Localizable {
    case Title
    
    enum View: String, Localizable {
        case Hello
        
        static let parent: LocalizeParent = Example.self
    }
    
    static let parent: LocalizeParent = nil
}