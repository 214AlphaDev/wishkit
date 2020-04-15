//
//  Wish+WishesResponse.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/9/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

extension Wish {
    
    init(output: API.WishesQuery.Data.Wish) throws {
        self = Wish(id: try UUIDV4(output.id), name: output.name, description: output.description, votes: output.votes, story: output.story, isVoted: output.votedOnIt, category: WishCategory(apiCategory: output.category))
    }
    
    init(output: API.VoteForWishMutation.Data.Vote.Wish) throws {
        self = Wish(id: try UUIDV4(output.id), name: output.name, description: output.description, votes: output.votes, story: output.story, isVoted: output.votedOnIt, category: WishCategory(apiCategory: output.category))
    }
    
    init(output: API.WithdrawVoteFromWishMutation.Data.WithdrawVote.Wish) throws {
        self = Wish(id: try UUIDV4(output.id), name: output.name, description: output.description, votes: output.votes, story: output.story, isVoted: output.votedOnIt, category: WishCategory(apiCategory: output.category))
    }
    
    init(output: API.CreateWishMutation.Data.Create.Wish) throws {
        self = Wish(id: try UUIDV4(output.id), name: output.name, description: output.description, votes: output.votes, story: output.story, isVoted: output.votedOnIt, category: WishCategory(apiCategory: output.category))
    }
    
}
