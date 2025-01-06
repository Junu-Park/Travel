//
//  ShoppingListTableViewCell.swift
//  Travel
//
//  Created by 박준우 on 1/4/25.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {

    static let id: String = "ShoppingListTableViewCell"
    
    @IBOutlet weak var shoppingView: UIView!
    
    @IBOutlet var shoppingButtonCollection: [UIButton]!
    
    @IBOutlet weak var shoppingLabel: UILabel!
    
    override func awakeFromNib() {
        shoppingView.backgroundColor = .systemGray6
        shoppingView.layer.cornerRadius = 10
        
        shoppingLabel.numberOfLines = 0
        shoppingLabel.font = .systemFont(ofSize: 14)
        
        for order in 0..<shoppingButtonCollection.count {
            shoppingButtonCollection[order].tintColor = .black
        }
    }
}
