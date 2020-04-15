//
//  Category+ValueObject.swift
//  WishKit
//
//  Created by Andrii Selivanov on 8/25/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public struct WishCategory: CustomStringConvertible {
    
    public enum Kind {
        case book
        case seed
        case other
    }
    
    public let kind: Kind
    
    public var description: String {
        return String(describing: kind)
    }
    
    public init(kind: Kind) {
        self.kind = kind
    }
    
}
