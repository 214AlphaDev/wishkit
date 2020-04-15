//
//  WishDetailsPresenter.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/11/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public class WishDetailsPresenter: WishDetailsPresenterProtocol {
    
    public var delegate: WeakWrapper<WishDetailsPresenterDelegate> = WeakWrapper()
    public let view: WishDetailsViewProtocol
    private let wishService: WishServiceProtocol
    private var wish: Wish
    
    public init(view: WishDetailsViewProtocol, wish: Wish, wishService: WishServiceProtocol) {
        self.view = view
        self.wishService = wishService
        self.wish = wish
        view.presenter = WeakWrapper(self)
        
        view.displayWish(wish)
    }
    
    public func vote() {
            wishService.voteForWish(with: wish.id) { [weak self] response in
                guard let self = self else { return }
                
                switch response {
                case .failure(let error):
                    self.view.displayError(title: "Error", error: error)
                case .success(let result):
                    self.updateWish(with: result.wish)
                }
            }
    }
    
    public func withdrawVote() {
        wishService.withdrawVoteFromWish(with: wish.id) { [weak self] response in
            guard let self = self else { return }
            
            switch response {
            case .failure(let error):
                self.view.displayError(title: "Error", error: error)
            case .success(let result):
                self.updateWish(with: result.wish)
            }
        }
    }
    
    private func updateWish(with wish: Wish) {
        self.wish = wish
        view.displayWish(wish)
    }
    
    public var viewController: UIViewController {
        return view.viewController
    }
    
}
