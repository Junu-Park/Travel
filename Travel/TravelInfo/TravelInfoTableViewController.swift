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
    var info = TravelInfo.travel
    
    let travelEnum = TravelEnum.travel
    
    override func awakeFromNib() {
        tabBarItem = .init(title: travelEnum.barTitle, image: .init(systemName: travelEnum.barImage), tag: 0)
        navigationItem.title = travelEnum.naviTitle
        navigationItem.backButtonTitle = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }

    // TODO: 특정 row(광고)의 위 아래의 seperator만 제거 하는 법
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if info[indexPath.row].ad {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: TravelAdTableViewCell.id,
                for: indexPath
            ) as! TravelAdTableViewCell
            
            // 광고 Cell 아래 seperator 제거하기
            cell.separatorInset = .init(top: 0, left: tableView.frame.width / 2, bottom: 0, right: tableView.frame.width / 2)
            
            cell.adTitle.text = info[indexPath.row].title
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: TravelInfoTableViewCell.id,
                for: indexPath
            ) as! TravelInfoTableViewCell
            
            // 광고 Cell 위 seperator 제거하기
            if (indexPath.row + 1) != info.count && info[indexPath.row + 1].ad {
                cell.separatorInset = .init(top: 0, left: tableView.frame.width / 2, bottom: 0, right: tableView.frame.width / 2)
            }
            
            for order in 0..<cell.infoLabelCollection.count {
                switch order {
                case 0:
                    cell.infoLabelCollection[order].text = info[indexPath.row].title
                case 1:
                    cell.infoLabelCollection[order].text = info[indexPath.row].description
                case 2:
                    // TODO: 별 그리기
                    cell.infoLabelCollection[order].text = "⭐️(\(info[indexPath.row].grade ?? 0))"
                case 3:
                    cell.infoLabelCollection[order].text = "• 저장 \((info[indexPath.row].save ?? 0).formatted())"
                default:
                    break
                }
            }
            
            cell.infoImage.kf.setImage(with: URL(string: info[indexPath.row].travel_image ?? ""), placeholder: UIImage(systemName: "photo"))
            
            cell.likeButton
                .setImage(UIImage(systemName: info[indexPath.row].like ?? false ? "heart.fill" : "heart"), for: .normal)
            
            cell.likeButton.tag = indexPath.row
            
            cell.likeButton.addTarget(self, action: #selector(likeButton), for: .touchUpInside)
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if info[indexPath.row].ad {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TravelAdInfoViewController") as! TravelAdInfoViewController
            
            vc.ad = info[indexPath.row].title
            let navVC = UINavigationController(rootViewController: vc)
            navVC.navigationBar.tintColor = .black
            
            navVC.modalPresentationStyle = .fullScreen
            navVC.modalTransitionStyle = .flipHorizontal
            
            present(navVC, animated: true)
        } else {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TravelDetailInfoViewController") as! TravelDetailInfoViewController
            
            vc.data = info[indexPath.row]
            
            navigationController?.pushViewController(vc, animated: true)
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
