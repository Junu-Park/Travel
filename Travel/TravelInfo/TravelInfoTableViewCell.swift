//
//  TravelInfoTableViewCell.swift
//  Travel
//
//  Created by 박준우 on 1/3/25.
//

import UIKit

class TravelInfoTableViewCell: UITableViewCell {

    static let id = "TravelInfoTableViewCell"
    
    @IBOutlet weak var infoView: UIView!
    
    @IBOutlet var infoStackViewCollection: [UIStackView]!
    
    @IBOutlet var infoLabelCollection: [UILabel]!
    
    @IBOutlet weak var infoImage: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        for order in 0..<infoStackViewCollection.count {
            infoStackViewCollection[order].spacing = 2
        }
        
        for order in 0..<infoLabelCollection.count {
            switch order {
            case 0:
                infoLabelCollection[order].textColor = .black
                infoLabelCollection[order].font = .boldSystemFont(ofSize: 16)
                infoLabelCollection[order].numberOfLines = 0
            case 1:
                infoLabelCollection[order].textColor = .gray
                infoLabelCollection[order].font = .boldSystemFont(ofSize: 14)
                infoLabelCollection[order].numberOfLines = 0
            case 2:
                // TODO: 별 그리기
                infoLabelCollection[order].textColor = .lightGray
                infoLabelCollection[order].font = .boldSystemFont(ofSize: 10)
            case 3:
                infoLabelCollection[order].textColor = .lightGray
                infoLabelCollection[order].font = .boldSystemFont(ofSize: 10)
            default:
                break
            }
        }
        
        infoImage.contentMode = .scaleToFill
        infoImage.layer.cornerRadius = 10
        
        likeButton.tintColor = .orange
    }
}
