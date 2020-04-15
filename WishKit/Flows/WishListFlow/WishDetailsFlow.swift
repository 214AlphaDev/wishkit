//
//  WishDetailsFlow.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/10/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol WishDetailsFlowProtocol: Flow {}

public struct WishDetailsFlowFactory {
    
    public static func build(
        wishDetailsPresenterFactory: (Wish) -> WishDetailsPresenterProtocol,
        wish: Wish) -> WishDetailsFlowProtocol {
        
        return WishDetailsFlow(wishDetailsPresenter: wishDetailsPresenterFactory(wish))
    }
    
}

public class WishDetailsFlow: SingleScreenFlow, WishDetailsFlowProtocol, WishDetailsPresenterDelegate {
    
    init(wishDetailsPresenter: WishDetailsPresenterProtocol) {
        super.init(presenter: wishDetailsPresenter)
        
        wishDetailsPresenter.delegate = WeakWrapper(self)
    }
    
}
