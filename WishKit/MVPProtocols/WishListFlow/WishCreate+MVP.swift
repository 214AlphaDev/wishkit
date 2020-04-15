//
//  WishCreate+MVP.swift
//  WishKit
//
//  Created by Andrii Selivanov on 5/9/19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import FlowKit

public protocol WishCreatePresenterDelegate: class {
    
    func presenterRequestNavigateToWishListScreen(_ presenter: WishCreatePresenterProtocol) throws
    
}

public enum WishCreateValidationField {
    case name(String)
    case description(String)
    case story(String?)
}

public protocol WishCreatePresenterProtocol: Presenter {
    
    var delegate: WeakWrapper<WishCreatePresenterDelegate> { get set }
    var view: WishCreateViewProtocol { get }
    
    func setName(_ name: String)
    func setDescription(_ description: String)
    func setStory(_ story: String?)
    func setCategory(_ category: WishCategory)
    func validate(field: WishCreateValidationField) -> ValidationResult
    func submit()
    func cancel()
    func clear()
    
}

public protocol WishCreateViewProtocol: class, ViewControllerProvider, ErrorDisplayable, LoadingIndicatorDisplayable {
    
    var presenter: WeakWrapper<WishCreatePresenterProtocol> { get set }
    
    func setDraft(_ draft: CreatingWish)
    
}
