//
//  Errors.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/9/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

protocol WishKitError: Error {
    var errorDescription: String { get }
}

enum ValidationError: WishKitError {
    case invalidUUIDV4String
    case invalidEmptyWishName
    case invalidTooSmallWishDescription
    case invalidTooSmallWishStory
    
    var errorDescription: String {
        switch self {
        case .invalidUUIDV4String:
            return "Provided uuidv4 string is invalid"
        case .invalidEmptyWishName:
            return "Wish should have non-empty name"
        case .invalidTooSmallWishDescription:
            return "Wish description should be at least 30 characters"
        case .invalidTooSmallWishStory:
            return "Wish story should be at least 20 characters or empty"
        }
    }
}

enum ResponseError: WishKitError {
    
    case requestFailed(serverErrorMessage: String)
    case missingResponseAndError
    case unknownError
    case unauthenticated
    
    case wishDoesNotExist
    case noVotesLeft
    
    var errorDescription: String {
        switch self {
        case .requestFailed(let message):
            return "Request failed with error message: \(message)"
        case .missingResponseAndError:
            return "Server responded without any response or error. Please report this issue"
        case .unknownError:
            return "Something went wrong"
        case .wishDoesNotExist:
            return "Requested wish does not exist"
        case .noVotesLeft:
            return "There is no votes left"
        case .unauthenticated:
            return "Not authorized"
        }
    }
    
}

enum PersistenceError: WishKitError {
    
    case wishPersistenceFailed(underlyingError: Error)
    
    var errorDescription: String {
        switch self {
        case .wishPersistenceFailed(let underlyingError):
            return "Failed to persist wish with underlying error \(ErrorDescription.describe(error: underlyingError) ?? underlyingError.localizedDescription)"
        }
    }
    
    
}
