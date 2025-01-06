//
//  TravelAdTableViewCell.swift
//  Travel
//
//  Created by 박준우 on 1/3/25.
//

import UIKit

class TravelAdTableViewCell: UITableViewCell {
    
    let adBackgroundColorList: [UIColor] = [.systemPink, .orange, .systemMint]
    
    static let id = "TravelAdTableViewCell"
    
    @IBOutlet weak var adView: UIView!
    @IBOutlet weak var adLabel: UILabel!
    @IBOutlet weak var adLabelView: UIView!
    @IBOutlet weak var adTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setView()
        setLabel()
        setTitle()
    }
    
    func setView() {
        adView.backgroundColor = adBackgroundColorList.randomElement()
        adView.layer.cornerRadius = 10
    }
    
    func setLabel() {
        adLabelView.backgroundColor = .systemGray6
        adLabelView.layer.cornerRadius = 10
        
        adLabel.text = "AD"
        adLabel.font = .boldSystemFont(ofSize: 14)
        adLabel.textAlignment = .center
    }
    
    func setTitle() {
        adTitle.numberOfLines = 0
        adTitle.font = .boldSystemFont(ofSize: 16)
        adTitle.textAlignment = .center
    }
}
