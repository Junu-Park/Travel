//
//  SearchCollectionViewCell.swift
//  Travel
//
//  Created by 박준우 on 1/8/25.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellSubTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        cellImage.contentMode = .scaleAspectFill
        cellImage.clipsToBounds = true
        
        cellTitle.font = .boldSystemFont(ofSize: 16)
        cellTitle.numberOfLines = 0
        cellTitle.textAlignment = .center
        
        cellSubTitle.font = .boldSystemFont(ofSize: 14)
        cellSubTitle.numberOfLines = 0
        cellSubTitle.textAlignment = .center
        cellSubTitle.textColor = .systemGray
    }

}
