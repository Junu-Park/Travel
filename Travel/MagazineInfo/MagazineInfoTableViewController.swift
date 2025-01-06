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
    
    let magazineEnum = TravelEnum.magazine
    
    override func awakeFromNib() {
        navigationItem.title = magazineEnum.naviTitle
        tabBarItem = .init(title: magazineEnum.barTitle, image: .init(systemName: magazineEnum.barImage), tag: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MagazineInfoTableViewCell.id, for: indexPath) as! MagazineInfoTableViewCell
        
        cell.infoTitle.text = info[indexPath.row].title
        
        cell.infoSubTitle.text = info[indexPath.row].subtitle
        
        cell.infoImage.kf.setImage(with: URL(string: info[indexPath.row].photo_image), placeholder: UIImage(systemName: "photo"))
        
        cell.infoDate.text = info[indexPath.row].date.getDateFromyyMMddString()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.tableView.frame.height / 2
    }
}
