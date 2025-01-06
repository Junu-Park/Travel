//
//  MagazineInfoTableViewCell.swift
//  Travel
//
//  Created by 박준우 on 1/3/25.
//

import UIKit

class MagazineInfoTableViewCell: UITableViewCell {

    static let id: String = "MagazineInfoTableViewCell"
    
    @IBOutlet weak var infoView: UIView!
    
    @IBOutlet weak var infoImage: UIImageView!
    
    @IBOutlet weak var infoTitle: UILabel!
    
    @IBOutlet weak var infoSubTitle: UILabel!
    
    @IBOutlet weak var infoDate: UILabel!
    
    override func awakeFromNib() {
        infoImage.contentMode = .scaleToFill
        infoImage.layer.cornerRadius = 10
        infoImage.clipsToBounds = true
        
        infoTitle.numberOfLines = 0
        infoTitle.font = .boldSystemFont(ofSize: 20)
        
        infoSubTitle.numberOfLines = 0
        infoSubTitle.font = .boldSystemFont(ofSize: 14)
        infoSubTitle.textColor = .lightGray
        
        infoDate.numberOfLines = 0
        infoDate.font = .boldSystemFont(ofSize: 14)
        infoDate.textColor = .lightGray
    }
}
