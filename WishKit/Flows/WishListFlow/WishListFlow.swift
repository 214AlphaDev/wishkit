//
//  WishListFlow.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/10/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

class PushWishDetailsScreenAction: Action {
    let wish: Wish
    
    init(wish: Wish) {
        self.wish = wish
    }
}
class DisplayWishCreateScreenAction: Action {}
class CloseWishCreateScreenAction: Action {}

public protocol WishListFlowProtocol: Flow {}

public struct WishListFlowFactory {
    
    public static func build(
        navigationController: UINavigationController,
        wishListPresenter: WishListPresenterProtocol,
        wishDetailsFlowFactory: @escaping (Wish) -> WishDetailsFlowProtocol,
        wishCreateFlow: WishCreateFlowProtocol) -> WishListFlowProtocol {
        let builder = FlowBuilder(rootFlow: WishListFlow(navigationController: navigationController, wishListPresenter: wishListPresenter))
        
        return builder
            .push(on: PushWishDetailsScreenAction.self) { _, action in
                return wishDetailsFlowFactory(action.wish)
            }
            .on(DisplayWishCreateScreenAction.self) { flow, _ in
                try flow.present(wishCreateFlow, animated: true)
            }
            .pop(WishDetailsFlowProtocol.self)
            .on(CloseWishCreateScreenAction.self) { root, _ in
                wishListPresenter.reloadWishes()
                root.dismissPresenterFlow(animated: true)
            }
            .rootFlow
    }
    
}

public class WishListFlow: PushPopNavigationFlow, WishListFlowProtocol, WishListPresenterDelegate {
    
    init(navigationController: UINavigationController, wishListPresenter: WishListPresenterProtocol) {
        super.init(navigationController: navigationController, rootFlow: SingleScreenFlow(presenter: wishListPresenter))
        
        wishListPresenter.delegate = WeakWrapper(self)
    }
    
    // MARK: WishListPresenterDelegate
    
    public func presenter(_ presenter: WishListPresenterProtocol, requestNavigateToWishDetailsScreenWith wish: Wish) throws {
        try handle(action: PushWishDetailsScreenAction(wish: wish))
    }
    
    public func presenterRequestNavigateToCreateWishScreen(_ presenter: WishListPresenterProtocol) throws {
        try handle(action: DisplayWishCreateScreenAction())
    }

    
}
