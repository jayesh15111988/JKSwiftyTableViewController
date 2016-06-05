//
//  JKUndoManager.swift
//  JKSwiftyTableViewController
//
//  Created by Jayesh Kawli Backup on 6/4/16.
//  Copyright © 2016 Jayesh Kawli Backup. All rights reserved.
//

import Foundation

struct JKUndoOperation<Item> {
    let initialList: [Item]
    var updatedListOfUndoItems: [[Item]]
    var currentItem: [Item]
    
    init (_ items: [Item]) {
        initialList = items
        updatedListOfUndoItems = []
        currentItem = initialList
    }
    
    var undoOperationAllowed: Bool {
        return !updatedListOfUndoItems.isEmpty
    }
    
    mutating func addToListOfUndoItems(item: [Item]) {
        updatedListOfUndoItems.append(item)
        currentItem = item
    }
    
    mutating func removeFromListOfUndoItems() {
        if let item = updatedListOfUndoItems.popLast() {
            currentItem = item
        } else {
            currentItem = initialList
        }
    }
 }