//
//  WishRepository.swift
//  WishKit
//
//  Created by Florian on 13.05.19.
//  Copyright © 2019 214alpha. All rights reserved.
//

import Foundation
import RealmSwift

class WishModel : Object {
    
    @objc dynamic var id : String = ""
    @objc dynamic var desc : String = ""
    @objc dynamic var voted : Bool = false
    @objc dynamic var votes : Int = 0
    @objc dynamic var name : String = ""
    @objc dynamic var story : String?
    @objc dynamic var category: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}

func mapWishModelToEntity (wish: WishModel) throws -> Wish {
    let wishID = try UUIDV4(wish.id)
    let category = WishCategory(stringIdentifier: wish.category)
    
    return Wish(id: wishID, name: wish.name, description: wish.desc, votes: wish.votes, story: wish.story, isVoted: wish.voted, category: category)
}

public class WishRepository: WishRepositoryProtocol {
    
    let db : Realm
    
    public init(db: Realm) {
        self.db = db
    }
    
    public func persist(wish: Wish) throws {
        
        // map entity to model
        let wm = WishModel()
        wm.id = wish.id.description
        wm.desc = wish.description
        wm.voted = wish.isVoted
        wm.votes = wish.votes
        wm.name = wish.name
        wm.story = wish.story
        wm.category = wish.category.stringIdentifier
        
        // persist model
        try self.db.write {
            self.db.add(wm, update: true)
        }

    }
    
    public func get(id: UUIDV4) throws -> Wish? {
        
        guard let wish = db.object(ofType: WishModel.self, forPrimaryKey: id.description) else {
            return nil
        }
        
        return try mapWishModelToEntity(wish: wish)
        
    }
    
    public func getAll() throws -> [Wish] {
        
        let wishModels = self.db.objects(WishModel.self)
        
        return try wishModels.map(mapWishModelToEntity)
        
    }
    
    public func get(fromId: UUIDV4?, count: Int) throws -> [Wish] {
        
        let wishes = self.db.objects(WishModel.self)
        let countToGet = min(wishes.count, count)
    
        var wishEntities = [Wish]()
        for i in 0..<countToGet {
            wishEntities.append(try mapWishModelToEntity(wish: wishes[i]))
        }
        
        return wishEntities
        
    }
    
}

extension WishCategory {
    
    init(stringIdentifier: String) {
        switch stringIdentifier {
        case "book":
            self.init(kind: .book)
        case "seed":
            self.init(kind: .seed)
        default:
            self.init(kind: .other)
        }
    }
    
    var stringIdentifier: String {
        switch self.kind {
        case .book:
            return "book"
        case .seed:
            return "seed"
        case .other:
            return "other"
        }
    }
    
}
