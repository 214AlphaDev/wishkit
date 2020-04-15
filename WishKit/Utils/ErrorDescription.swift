//
//  ErrorDescription.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/9/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public struct ErrorDescription {
    
    public static func describe(error: Error) -> String? {
        guard let wishKitError = error as? WishKitError else {
            return nil
        }
        
        return wishKitError.errorDescription
    }
    
}
