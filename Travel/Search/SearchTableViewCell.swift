//
//  SearchTableViewCell.swift
//  Travel
//
//  Created by 박준우 on 1/6/25.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var cityImage: UIImageView!
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityExplain: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
