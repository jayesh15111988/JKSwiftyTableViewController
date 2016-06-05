//
//  ViewController.swift
//  JKSwiftyTableViewController
//
//  Created by Jayesh Kawli Backup on 6/4/16.
//  Copyright © 2016 Jayesh Kawli Backup. All rights reserved.
//

import UIKit

final class ViewController<Item>: UITableViewController {

    var undoOp: JKUndoOperation<Item>
    var items: [Item] {
        didSet {
            tableView.reloadData()
            self.navigationItem.leftBarButtonItem = items.count > 0 ? UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: #selector(self.deleteItem)) : nil
            self.navigationItem.rightBarButtonItem = undoOp.undoOperationAllowed ? UIBarButtonItem(barButtonSystemItem: .Undo, target: self, action: #selector(self.undoItem)) : nil
        }
    }
    
    let config: (UITableViewCell, Item) -> ()
    
    init(items: [Item], config: (UITableViewCell, Item) -> (), style: UITableViewStyle, editable: Bool) {
        self.items = items
        self.config = config
        undoOp = JKUndoOperation(items)
        super.init(style: style)
        
        if editable {
            self.navigationItem.leftBarButtonItem = items.count > 0 ? UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: #selector(self.deleteItem)) : nil
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "cellIdentifier")
        let item = items[indexPath.row]
        config(cell, item)
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        guard editingStyle == .Delete else { return }
        undoOp.addToListOfUndoItems(items)
        items.removeAtIndex(indexPath.row)
    }
    
    func deleteItem() {
        UIView.animateWithDuration(0.25) {
            self.tableView.editing = !self.tableView.editing
        }
    }
    
    func undoItem() {
        undoOp.removeFromListOfUndoItems()
        items = undoOp.currentItem
    }

}

