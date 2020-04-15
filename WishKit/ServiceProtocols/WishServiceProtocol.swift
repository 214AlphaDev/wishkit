//
//  WishServiceProtocol.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/9/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public protocol WishServiceProtocol {
    
    /// Gets the wish from database.
    ///
    /// - Parameter id: Id of the wish to get.
    /// - Returns: Returns a wish or nil if this wish doesn't exist in database.
    /// - Throws: Database errors.
    func getWish(id: UUIDV4) throws -> Wish?
    
    /// Gets all wishes from the database.
    ///
    /// - Returns: Array of all wishes in database.
    /// - Throws: Database errors.
    func getAllWishes() throws -> [Wish]
    
    /// Gets specific number of wishes from database starting with specified id.
    ///
    /// - Parameters:
    ///   - fromId: Id to start from or nil to start from the beginning.
    ///   - count: Number of wishes to get.
    /// - Returns: A list of wishes.
    /// - Throws: Database errors.
    func getWishes(fromId: UUIDV4?, count: Int) throws -> [Wish]
    
    /// Fetches wishes from backend.
    ///
    /// - Parameters:
    ///   - fromId: Id of wish to start from or nil to start from the beginning.
    ///   - count: Number of wishes to fetch.
    ///   - callback: Called when request is done.
    func fetchWishes(fromId: UUIDV4?, count: Int, callback: @escaping (Response<[Wish]>) -> Void)
    
    /// Sends the request to vote for the wish.
    ///
    /// - Parameters:
    ///   - id: Id of the wish to vote.
    ///   - callback: Callback when request is done. Response contains updated wish and number of available votes left for current user.
    func voteForWish(with id: UUIDV4, callback: @escaping (Response<(wish: Wish, votesLeft: Int)>) -> Void)
    
    /// Sends the request to withdraw vote from the wish.
    ///
    /// - Parameters:
    ///   - id: Id of the wish to withdraw vote from.
    ///   - callback: Callback when request is done. Response contains updated wish and number of available votes left for current user.
    func withdrawVoteFromWish(with id: UUIDV4, callback: @escaping (Response<(wish: Wish, votesLeft: Int)>) -> Void)
    
    /// Sends the request to create new wish.
    ///
    /// - Parameters:
    ///   - creatingWish: Information needed to create the wish.
    ///   - callback: Callback with wish on success and error on fail.
    func createWish(_ creatingWish: CreatingWish, callback:  @escaping (Response<Wish>) -> Void)
    
}
