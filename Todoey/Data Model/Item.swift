//
//  Item.swift
//  Todoey
//
//  Created by Madhuri kumari on 12/04/18.
//  Copyright © 2018 Madhuri kumari. All rights reserved.
//

import Foundation

//class Item: Encodable, Decodable {
class Item: Codable {
    var title: String = ""
    var done: Bool = false
}
