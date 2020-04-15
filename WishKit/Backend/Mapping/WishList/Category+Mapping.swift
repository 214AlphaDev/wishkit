//
//  Category+Mapping.swift
//  WishKit
//
//  Created by Andrii Selivanov on 8/25/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

extension API.Category {
    
    init(_ category: WishCategory) {
        switch category.kind {
        case .other:
            self = .other
        case .book:
            self = .book
        case .seed:
            self = .seed
        }
    }
    
}

extension WishCategory {
    
    init(apiCategory: API.Category) {
        switch apiCategory {
        case .book:
            self.init(kind: .book)
        case .seed:
            self.init(kind: .seed)
        case .other:
            self.init(kind: .other)
        case .__unknown(_):
            self.init(kind: .other)
        }
    }
    
}
