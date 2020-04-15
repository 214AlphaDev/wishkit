//
//  WishCreatePresenter.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/11/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public class WishCreatePresenter: WishCreatePresenterProtocol {
    
    public var delegate: WeakWrapper<WishCreatePresenterDelegate> = WeakWrapper()
    public let view: WishCreateViewProtocol
    private var creatingWish: CreatingWish = CreatingWish(name: "", description: "", story: nil, category: WishCategory(kind: .other))
    private let wishService: WishServiceProtocol
    
    public init(view: WishCreateViewProtocol, wishService: WishServiceProtocol, draft: CreatingWish? = nil) {
        self.view = view
        self.wishService = wishService
        view.presenter = WeakWrapper(self)
        
        if let draft = draft {
            self.creatingWish = draft
        }
    }
    
    public func setName(_ name: String) {
        self.creatingWish.name = name
    }
    
    public func setDescription(_ description: String) {
        self.creatingWish.description = description
    }
    
    public func setStory(_ story: String?) {
        self.creatingWish.story = story
    }
    
    public func setCategory(_ category: WishCategory) {
        self.creatingWish.category = category
    }
    
    public func submit() {
        wishService.createWish(creatingWish) { [weak self] response in
            guard let self = self else { return }
            
            do {
                switch response {
                case .failure(let error):
                    throw error
                case .success(_):
                    try self.delegate.wrapped?.presenterRequestNavigateToWishListScreen(self)
                    self.clear()
                }
            } catch {
                self.view.displayError(title: "Error", error: error)
            }
        }
    }
    
    public func cancel() {
        do {
            try delegate.wrapped?.presenterRequestNavigateToWishListScreen(self)
        } catch {
            view.displayError(title: "Error", error: error)
        }
    }
    
    public func clear() {
        self.creatingWish = CreatingWish(name: "", description: "", story: nil, category: WishCategory(kind: .other))
        self.view.setDraft(creatingWish)
    }
    
    // MARK: Validation
    
    public func validate(field: WishCreateValidationField) -> ValidationResult {
        switch field {
        case .description(let description):
            return description.count < 30 ? .invalid(ValidationError.invalidTooSmallWishDescription) : .valid
        case .name(let name):
            return name.isEmpty ? .invalid(ValidationError.invalidEmptyWishName) : .valid
        case .story(let story):
            if let story = story {
                return story.count < 20 ? .invalid(ValidationError.invalidTooSmallWishStory) : .valid
            }
            
            return .valid
        }
    }
    
    // MARK: ViewControllerProvider
    
    public var viewController: UIViewController {
        return view.viewController
    }
    
}
