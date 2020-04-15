//
//  WishBackend.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/9/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import Apollo

public class WishBackend: WishBackendProtocol {
    
    var apollo: ApolloClient
    
    public init(url: URL, rawAccessToken: String) {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Authorization-Bearer": rawAccessToken]
        self.apollo = ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }
    
    public func wishes(from id: UUIDV4?, count: Int, callback: @escaping (Response<[Wish]>) -> Void) {
        apollo.fetch(query: API.WishesQuery(fromId: id?.id, count: count), cachePolicy: .fetchIgnoringCacheData) { result, error in
            if let error = error {
                callback(.failure(ResponseError.requestFailed(serverErrorMessage:  error.localizedDescription)))
                return
            }
            
            guard let response = result?.data?.wishes else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            do {
                let wishes = try response.map {
                    try Wish(output: $0)
                }
                callback(.success(wishes))
            } catch {
                callback(.failure(error))
            }
        }
    }
    
    public func createWish(_ creatingWish: CreatingWish, callback: @escaping (Response<Wish>) -> Void) {
        apollo.perform(mutation: API.CreateWishMutation(name: creatingWish.name, description: creatingWish.description, story: creatingWish.story, category: API.Category(creatingWish.category))) { result, error in
            if let error = error {
                callback(.failure(ResponseError.requestFailed(serverErrorMessage:  error.localizedDescription)))
                return
            }
            
            guard let response = result?.data?.create else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            if let error = response.error {
                callback(.failure(ResponseError(createWishError: error)))
                return
            }
            
            guard let wishOutput = response.wish else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            do {
                callback(.success(try Wish(output: wishOutput)))
            } catch {
                callback(.failure(error))
            }
        }
    }
    
    public func voteForWish(with id: UUIDV4, callback: @escaping (Response<(Wish, Int)>) -> Void) {
        apollo.perform(mutation: API.VoteForWishMutation(id: id.id)) { result, error in
            if let error = error {
                callback(.failure(ResponseError.requestFailed(serverErrorMessage:  error.localizedDescription)))
                return
            }
            
            guard let response = result?.data?.vote else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            if let error = response.error {
                callback(.failure(ResponseError(voteError: error)))
                return
            }
            
            guard let wishOutput = response.wish, let votesLeft = response.votesLeft else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            do {
                callback(.success((try Wish(output: wishOutput), votesLeft)))
            } catch {
                callback(.failure(error))
            }
        }
    }
    
    public func withdrawVoteFromWish(with id: UUIDV4, callback: @escaping (Response<(Wish, Int)>) -> Void) {
        apollo.perform(mutation: API.WithdrawVoteFromWishMutation(id: id.id)) { result, error in
            if let error = error {
                callback(.failure(ResponseError.requestFailed(serverErrorMessage:  error.localizedDescription)))
                return
            }
            
            guard let response = result?.data?.withdrawVote else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            if let error = response.error {
                callback(.failure(ResponseError(withdrawVoteError: error)))
                return
            }
            
            guard let wishOutput = response.wish, let votesLeft = response.votesLeft else {
                callback(.failure(ResponseError.missingResponseAndError))
                return
            }
            
            do {
                callback(.success((try Wish(output: wishOutput), votesLeft)))
            } catch {
                callback(.failure(error))
            }
        }
    }
    
}

