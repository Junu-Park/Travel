//
//  TravelInfoTableViewCell.swift
//  Travel
//
//  Created by 박준우 on 1/3/25.
//

import UIKit

class TravelInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var infoView: UIView!
    
    @IBOutlet var infoStackViewCollection: [UIStackView]!
    
    @IBOutlet var infoLabelCollection: [UILabel]!
    
    @IBOutlet weak var infoImage: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    
}
