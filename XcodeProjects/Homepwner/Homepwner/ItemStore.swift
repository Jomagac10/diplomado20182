//
//  ItemStore.swift
//  Homepwner
//
//  Created by Jose Manuel García Chávez on 6/5/18.
//  Copyright © 2018 Jose Manuel García Chávez. All rights reserved.
//

import UIKit

class ItemStore{
    var allItems = [Item]()
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
}
