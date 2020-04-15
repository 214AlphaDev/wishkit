//
//  Errors+WishList.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/9/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

extension ResponseError {
    
    init(voteError: API.VoteError) {
        switch voteError {
        case .unauthenticated:
            self = .unauthenticated
        case .wishDoesNotExist:
            self = .wishDoesNotExist
        case .noVotesLeft:
            self = .noVotesLeft
        case .__unknown(_):
            self = .unknownError
        }
    }
    
    init(withdrawVoteError: API.WithdrawVoteError) {
        switch withdrawVoteError {
        case .unauthenticated:
            self = .unauthenticated
        case .wishDoesNotExist:
            self = .wishDoesNotExist
        case .__unknown(_):
            self = .unknownError
        }
    }
    
    init(createWishError: API.CreateWishError) {
        switch createWishError {
        case .unauthenticated:
            self = .unauthenticated
        case .__unknown(_):
            self = .unknownError
        }
    }
    
}
