//
//  WishRepositoryProtocol.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/9/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public protocol WishRepositoryProtocol {
    
    /// Persists the wish in database.
    ///
    /// - Parameter wish: Wish to persist.
    /// - Throws: Database errors.
    func persist(wish: Wish) throws
    
    /// Gets the wish from database.
    ///
    /// - Parameter id: Id of wish to get.
    /// - Returns: Wish or nil if no wish exists with specified id.
    /// - Throws: Database errors.
    func get(id: UUIDV4) throws -> Wish?
    
    /// Gets all wishes from database
    ///
    /// - Returns: Array of wishes.
    /// - Throws: Database errors.
    func getAll() throws -> [Wish]
    
    /// Gets specific range of wishes from database.
    ///
    /// - Parameters:
    ///   - fromId: Id to start from or nil to start from the beginning.
    ///   - count: Number of wishes to get.
    /// - Returns: Array of wishes.
    /// - Throws: Database errors.
    func get(fromId: UUIDV4?, count: Int) throws -> [Wish]
    
}
