//
//  WishDetails+MVP.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/9/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol WishDetailsPresenterDelegate: class {}

public protocol WishDetailsPresenterProtocol: Presenter {
    
    var delegate: WeakWrapper<WishDetailsPresenterDelegate> { get set }
    var view: WishDetailsViewProtocol { get }
    
    func vote()
    func withdrawVote()
    
}

public protocol WishDetailsViewProtocol: class, ViewControllerProvider, ErrorDisplayable, LoadingIndicatorDisplayable {
    
    var presenter: WeakWrapper<WishDetailsPresenterProtocol> { get set }
    
    func displayWish(_ wish: Wish)

}
