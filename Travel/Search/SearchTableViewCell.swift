//
//  SearchTableViewCell.swift
//  Travel
//
//  Created by 박준우 on 1/6/25.
//

import UIKit
import Kingfisher

class SearchTableViewCell: UITableViewCell {
    
    static let id: String = "SearchTableViewCell"
    
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityExplain: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setImage()
        setTitle()
        setExplain()
    }
    
    func setImage() {
        cityImage.layer.cornerRadius = 15
        cityImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        cityImage.backgroundColor = .orange
        cityImage.tintColor = .orange
        cityImage.contentMode = .scaleAspectFill
    }
    
    func setTitle() {
        cityName.textColor = .white
        cityName.font = .boldSystemFont(ofSize: 19)
    }
    
    func setExplain() {
        cityExplain.font = .systemFont(ofSize: 13, weight: .semibold)
        cityExplain.layer.cornerRadius = 15
        cityExplain.layer.maskedCorners = [.layerMaxXMaxYCorner]
        cityExplain.textColor = .white
        cityExplain.backgroundColor = .black.withAlphaComponent(0.5)
        // TODO: UIImage는 clipsToBounds 안해도 괜찮았는데 UILabel은 왜...??
        cityExplain.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        cityImage.image = .init(systemName: "photo")
    }
}
