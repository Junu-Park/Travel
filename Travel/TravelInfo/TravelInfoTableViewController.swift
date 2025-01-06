//
//  TravelInfoTableViewController.swift
//  Travel
//
//  Created by 박준우 on 1/3/25.
//

import UIKit
import Kingfisher

class TravelInfoTableViewController: UITableViewController {

    // TODO: didSet에서 어떤 값이 바뀌었는지 혹은 바뀐 값의 인덱스도 받아오는 법
    // => didSet의 경우 oldValue(바뀌기 전 값을 받아올 수 있다.),,,근데 바뀐 부분만 들고 오는게 아니라 통째로 들고오네...?
    var info = TravelInfo().travel
//    {
//        didSet {
//        tableView.reloadData()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "도시 상세 정보"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }

    // TODO: 특정 row(광고)의 위 아래의 seperator만 제거 하는 법
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if info[indexPath.row].ad {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "TravelAdTableViewCell",
                for: indexPath
            ) as! TravelAdTableViewCell
            
            let adBackgroundColorList: [UIColor] = [
                .systemPink,
                .orange,
                .systemMint
            ]
            
            // 광고 Cell 아래 seperator 제거하기
            cell.separatorInset = .init(top: 0, left: tableView.frame.width / 2, bottom: 0, right: tableView.frame.width / 2)
            
            cell.adView.backgroundColor = adBackgroundColorList.randomElement()
            cell.adView.layer.cornerRadius = 10
            
            cell.adLabelView.backgroundColor = .systemGray6
            cell.adLabelView.layer.cornerRadius = 10
            
            cell.adLabel.text = "AD"
            cell.adLabel.font = .boldSystemFont(ofSize: 14)
            cell.adLabel.textAlignment = .center
            
            cell.adTitle.text = info[indexPath.row].title
            cell.adTitle.numberOfLines = 0
            cell.adTitle.font = .boldSystemFont(ofSize: 16)
            cell.adTitle.textAlignment = .center
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "TravelInfoTableViewCell",
                for: indexPath
            ) as! TravelInfoTableViewCell
            
            for order in 0..<cell.infoStackViewCollection.count {
                cell.infoStackViewCollection[order].spacing = 2
            }
            
            // 광고 Cell 위 seperator 제거하기
            if (indexPath.row + 1) != info.count && info[indexPath.row + 1].ad {
                cell.separatorInset = .init(top: 0, left: tableView.frame.width / 2, bottom: 0, right: tableView.frame.width / 2)
            }
            
            for order in 0..<cell.infoLabelCollection.count {
                switch order {
                case 0:
                    cell.infoLabelCollection[order].textColor = .black
                    cell
                        .infoLabelCollection[order].font = 
                        .boldSystemFont(ofSize: 16)
                    cell
                        .infoLabelCollection[order].text = info[indexPath.row].title
                    cell.infoLabelCollection[order].numberOfLines = 0
                case 1:
                    cell.infoLabelCollection[order].textColor = .gray
                    cell
                        .infoLabelCollection[order].font = 
                        .boldSystemFont(ofSize: 14)
                    cell
                        .infoLabelCollection[order].text = info[indexPath.row].description
                    cell.infoLabelCollection[order].numberOfLines = 0
                case 2:
                    // TODO: 별 그리기
                    cell.infoLabelCollection[order].textColor = .lightGray
                    cell
                        .infoLabelCollection[order].font = 
                        .boldSystemFont(ofSize: 10)
                    cell
                        .infoLabelCollection[order].text = "⭐️(\(info[indexPath.row].grade ?? 0))"
                case 3:
                    cell.infoLabelCollection[order].textColor = .lightGray
                    cell
                        .infoLabelCollection[order].font = 
                        .boldSystemFont(ofSize: 10)
                    cell
                        .infoLabelCollection[order].text = "• 저장 \((info[indexPath.row].save ?? 0).formatted())"
                default:
                    break
                }
            }
            
            cell.infoImage.kf
                .setImage(
                    with: URL(string: info[indexPath.row].travel_image ?? ""),
                    placeholder: UIImage(systemName: "photo")
                )
            cell.infoImage.contentMode = .scaleToFill
            cell.infoImage.layer.cornerRadius = 10
            
            cell.likeButton
                .setImage(
                    UIImage(
                        systemName: info[indexPath.row].like ?? false ? "heart.fill" : "heart"
                    ),
                    for: .normal
                )
            cell.likeButton.tag = indexPath.row
            cell.likeButton.tintColor = .orange
            cell.likeButton
                .addTarget(
                    self,
                    action: #selector(likeButton),
                    for: .touchUpInside
                )
            
            return cell
        }
    }
    
    @objc func likeButton(_ sender: UIButton) {
        if info[sender.tag].like ?? false {
            info[sender.tag].like = false
        } else {
            info[sender.tag].like = true
        }
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .none)
    }
}
