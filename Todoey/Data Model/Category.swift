//
//  Category.swift
//  Todoey
//
//  Created by Madhuri kumari on 14/04/18.
//  Copyright © 2018 Madhuri kumari. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name: String = ""
    let items = List<Item>()
    
    //let array : [Int] = [1,2,3] <=====> let array : Array<Int> = [1,2,3] <=====> let array = Array<Int>()
    
    
}
