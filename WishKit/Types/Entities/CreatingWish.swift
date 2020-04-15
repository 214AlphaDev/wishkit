//
//  CreatingWish.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/9/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

/// Represents item of wish list that is in a process of creation. 
public struct CreatingWish {
    
    public var name: String
    public var description: String
    public var story: String?
    public var category: WishCategory
    
    public init(name: String, description: String, story: String?, category: WishCategory) {
        self.name = name
        self.description = description
        self.story = story
        self.category = category
    }
    
}
