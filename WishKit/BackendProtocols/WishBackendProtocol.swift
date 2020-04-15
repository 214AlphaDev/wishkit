//
//  WishBackendProtocol.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/9/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public protocol WishBackendProtocol {
    
    /// Requests wishes from backend.
    ///
    /// - Parameters:
    ///   - id: Id of wish to start from or nil to start from the beginning.
    ///   - count: Number of wishes to get.
    ///   - callback: Callback when request is done with array of wishes or error.
    func wishes(from id: UUIDV4?, count: Int, callback: @escaping (Response<[Wish]>) -> Void)
    
    /// Requests wish creation.
    ///
    /// - Parameters:
    ///   - creatingWish: Information needed to create the wish.
    ///   - callback: Callback when request is done with wish or error.
    func createWish(_ creatingWish: CreatingWish, callback: @escaping (Response<Wish>) -> Void)
    
    /// Requests vote for the wish.
    ///
    /// - Parameters:
    ///   - id: Id of wish to vote.
    ///   - callback: Callback when request is done with updated wish and left votes count for current user or error.
    func voteForWish(with id: UUIDV4, callback: @escaping (Response<(Wish, Int)>) -> Void)
    
    /// Requests withdraw vote from the wish.
    ///
    /// - Parameters:
    ///   - id: Id of wish to withdraw vote from.
    ///   - callback: Callback when request is done with updated wish and left votes count for current user or error.
    func withdrawVoteFromWish(with id: UUIDV4, callback: @escaping (Response<(Wish, Int)>) -> Void)
    
}
