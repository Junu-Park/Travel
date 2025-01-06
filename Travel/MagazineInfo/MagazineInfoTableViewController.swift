//
//  MagazineInfoTableViewController.swift
//  Travel
//
//  Created by 박준우 on 1/3/25.
//

import UIKit
import Kingfisher

class MagazineInfoTableViewController: UITableViewController {

    var info = MagazineInfo().magazine
    
    override func awakeFromNib() {
        tabBarItem = .init(title: "잡지", image: .init(systemName: "magazine"), tag: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "SeSAC TRAVEL"
        tableView.separatorStyle = .none
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineInfoTableViewCell", for: indexPath) as! MagazineInfoTableViewCell
        
        cell.infoImage.contentMode = .scaleToFill
        cell.infoImage.layer.cornerRadius = 10
        cell.infoImage.clipsToBounds = true
        cell.infoImage.kf.setImage(with: URL(string: info[indexPath.row].photo_image), placeholder: UIImage(systemName: "photo"))
        
        cell.infoTitle.numberOfLines = 0
        cell.infoTitle.font = .boldSystemFont(ofSize: 20)
        cell.infoTitle.text = info[indexPath.row].title
        
        cell.infoSubTitle.numberOfLines = 0
        cell.infoSubTitle.font = .boldSystemFont(ofSize: 14)
        cell.infoSubTitle.text = info[indexPath.row].subtitle
        cell.infoSubTitle.textColor = .lightGray

        cell.infoDate.numberOfLines = 0
        cell.infoDate.font = .boldSystemFont(ofSize: 14)
        cell.infoDate.text = info[indexPath.row].date.getDateFromyyMMddString()
        cell.infoDate.textColor = .lightGray
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.tableView.frame.height / 2
    }
}
