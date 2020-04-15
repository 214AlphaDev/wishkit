//
//  WishCreateFlow.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/10/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol WishCreateFlowProtocol: Flow {}

public struct WishCreateFlowFactory {
    
    public static func build(wishCreatePresenter: WishCreatePresenterProtocol) -> WishCreateFlowProtocol {
        
        return WishCreateFlow(wishCreatePresenter: wishCreatePresenter)
    }
    
}

class WishCreateFlow: SingleScreenFlow, WishCreateFlowProtocol, WishCreatePresenterDelegate {
    
    init(wishCreatePresenter: WishCreatePresenterProtocol) {
        super.init(presenter: wishCreatePresenter)
        
        wishCreatePresenter.delegate = WeakWrapper(self)
    }
    
    // MARK: WishCreatePresenterDelegate
    
    func presenterRequestNavigateToWishListScreen(_ presenter: WishCreatePresenterProtocol) throws {
        try handle(action: CloseWishCreateScreenAction())
    }
    
}
