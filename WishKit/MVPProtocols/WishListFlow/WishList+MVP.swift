//
//  WishList+MVP.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/9/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol WishListPresenterDelegate: class {
    
    func presenter(_ presenter: WishListPresenterProtocol, requestNavigateToWishDetailsScreenWith wish: Wish) throws
    func presenterRequestNavigateToCreateWishScreen(_ presenter: WishListPresenterProtocol) throws
    
}

public protocol WishListPresenterProtocol: Presenter {
    
    var delegate: WeakWrapper<WishListPresenterDelegate> { get set }
    var view: WishListViewProtocol { get }
    
    func openDetailsScreen(for wish: Wish)
    func openCreateWishScreen()
    /// Initiates fetch of wishes from backend
    ///
    /// - Parameter callback: Callback that is called when fetch request is done, regardless of whether it was successful
    func fetchWishes(callback: @escaping () -> Void)
    /// Reloads wishes available on database
    func reloadWishes()
    
}

public protocol WishListViewProtocol: class, ViewControllerProvider, ErrorDisplayable, LoadingIndicatorDisplayable {
    
    var presenter: WeakWrapper<WishListPresenterProtocol> { get set }
    
    func showWishes(_ wishes: [Wish])
    
}
