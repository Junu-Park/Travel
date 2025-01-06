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
        super.awakeFromNib()
        
        setView()
        setLabel()
        setButton()
    }
    
    func setView() {
        shoppingView.backgroundColor = .systemGray6
        shoppingView.layer.cornerRadius = 10
    }
    
    func setLabel() {
        shoppingLabel.numberOfLines = 0
        shoppingLabel.font = .systemFont(ofSize: 14)
    }
    
    func setButton() {
        for order in 0..<shoppingButtonCollection.count {
            shoppingButtonCollection[order].tintColor = .black
        }
    }
}
