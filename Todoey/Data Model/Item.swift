//
//  Item.swift
//  Todoey
//
//  Created by Madhuri kumari on 14/04/18.
//  Copyright © 2018 Madhuri kumari. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dataCreated: Data?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
}
