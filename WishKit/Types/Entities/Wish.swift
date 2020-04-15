//
//  Wish.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/9/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

/// Represents the item in the wish list.
public struct Wish {
    
    public let id: UUIDV4
    public let name: String
    public let description: String
    public let story: String?
    public let votes: Int
    public let isVoted: Bool
    public let category: WishCategory
    
    public init(id: UUIDV4, name: String, description: String, votes: Int, story: String?, isVoted: Bool, category: WishCategory) {
        self.id = id
        self.name = name
        self.description = description
        self.story = story
        self.votes = votes
        self.isVoted = isVoted
        self.category = category
    }
    
}

