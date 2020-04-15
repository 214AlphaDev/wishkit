//
//  WishService.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/9/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public class WishService: WishServiceProtocol {
    
    let wishRepository: WishRepositoryProtocol
    let wishBackend: WishBackendProtocol
    
    public init(wishBackend: WishBackendProtocol,
                wishRepository: WishRepositoryProtocol) {
        self.wishBackend = wishBackend
        self.wishRepository = wishRepository
    }
    
    public func getWish(id: UUIDV4) throws -> Wish? {
        return try wishRepository.get(id: id)
    }
    
    public func getAllWishes() throws -> [Wish] {
        return sortedWishes(try wishRepository.getAll())
    }
    
    public func getWishes(fromId: UUIDV4?, count: Int) throws -> [Wish] {
        return sortedWishes(try wishRepository.get(fromId: fromId, count: count))
    }
    
    public func fetchWishes(fromId: UUIDV4?, count: Int, callback: @escaping (Response<[Wish]>) -> Void) {
        wishBackend.wishes(from: fromId, count: count) { [weak self] response in
            guard let self = self else {
                callback(.failure(ResponseError.unknownError))
                return
            }
            
            switch response {
                
            case .success(let wishes):
                do {
                    try wishes.forEach { wish in
                        try self.saveWish(wish)
                    }
                    callback(.success(self.sortedWishes(wishes)))
                } catch {
                    callback(.failure(PersistenceError.wishPersistenceFailed(underlyingError: error)))
                }
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
    
    public func voteForWish(with id: UUIDV4, callback: @escaping (Response<(wish: Wish, votesLeft: Int)>) -> Void) {
        wishBackend.voteForWish(with: id) { [weak self] response in
            switch response {
                
            case .success(let (wish, votesLeft)):
                do {
                    try self?.saveWish(wish)
                    callback(.success((wish, votesLeft)))
                } catch {
                    callback(.failure(PersistenceError.wishPersistenceFailed(underlyingError: error)))
                }
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
    
    public func withdrawVoteFromWish(with id: UUIDV4, callback: @escaping (Response<(wish: Wish, votesLeft: Int)>) -> Void) {
        wishBackend.withdrawVoteFromWish(with: id) { [weak self] response in
            switch response {
                
            case .success(let (wish, votesLeft)):
                do {
                    try self?.saveWish(wish)
                    callback(.success((wish, votesLeft)))
                } catch {
                    callback(.failure(PersistenceError.wishPersistenceFailed(underlyingError: error)))
                }
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
    
    public func createWish(_ creatingWish: CreatingWish, callback: @escaping (Response<Wish>) -> Void) {
        wishBackend.createWish(creatingWish) { [weak self] response in
            switch response {
                
            case .success(let wish):
                do {
                    try self?.saveWish(wish)
                    callback(.success(wish))
                } catch {
                    callback(.failure(PersistenceError.wishPersistenceFailed(underlyingError: error)))
                }
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
    
    func saveWish(_ wish: Wish) throws {
        try wishRepository.persist(wish: wish)
    }
    
    private func sortedWishes(_ wishes: [Wish]) -> [Wish] {
        return wishes.sorted(by: { lhs, rhs -> Bool in
            if lhs.votes != rhs.votes {
                return lhs.votes > rhs.votes
            }
            
            return lhs.id.description < rhs.id.description
        })
    }
    
}
