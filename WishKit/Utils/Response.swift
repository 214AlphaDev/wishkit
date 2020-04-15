//
//  Response.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/9/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation

public enum Response<T> {
    case failure(Error)
    case success(T)
}
