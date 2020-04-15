//
//  WishListPresenter.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/10/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public class WishListPresenter: WishListPresenterProtocol {
    
    public var delegate: WeakWrapper<WishListPresenterDelegate> = WeakWrapper()
    public let view: WishListViewProtocol
    private let wishService: WishServiceProtocol
    
    public init(view: WishListViewProtocol, wishService: WishServiceProtocol) {
        self.view = view
        self.wishService = wishService
        view.presenter = WeakWrapper(self)
        
        displayWishes()
    }
    
    public func openDetailsScreen(for wish: Wish) {
        do {
            try delegate.wrapped?.presenter(self, requestNavigateToWishDetailsScreenWith: wish)
        } catch {
            view.displayError(title: "Error", error: error)
        }
    }
    
    public func openCreateWishScreen() {
        do {
            try delegate.wrapped?.presenterRequestNavigateToCreateWishScreen(self)
        } catch {
            view.displayError(title: "Error", error: error)
        }
    }
    
    public func fetchWishes(callback: @escaping () -> Void) {
        wishService.fetchWishes(fromId: nil, count: 100) { [weak self] response in
            guard let self = self else {
                callback()
                return
            }
            
            switch response {
            case .failure(let error):
                self.view.displayError(title: "Error", error: error)
            case .success(let wishes):
                self.displayWishes(wishes)
            }
            callback()
        }
    }
    
    public func reloadWishes() {
        displayWishes()
    }
    
    private func displayWishes(_ wishes: [Wish]? = nil) {
        if let wishes = wishes ?? (try? wishService.getAllWishes()) {
            view.showWishes(wishes)
        }
    }
    
    public var viewController: UIViewController {
        return view.viewController
    }
    
}
