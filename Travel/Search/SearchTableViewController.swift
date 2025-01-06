//
//  SearchTableViewController.swift
//  Travel
//
//  Created by 박준우 on 1/6/25.
//

import UIKit

class SearchTableViewController: UITableViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchSegmentedControl: UISegmentedControl!
    
    let allInfo = CityInfo.city
    
    var filteredInfo = CityInfo.city {
        didSet {
            tableView.reloadData()
        }
    }
    
    let segmentTitleList = ["모두", "국내", "해외"]
    
    let searchEnum = TravelEnum.search
    
    override func awakeFromNib() {
        super.awakeFromNib()
        navigationItem.title = searchEnum.naviTitle
        
        tabBarItem = .init(
            title: searchEnum.barTitle,
            image: .init(systemName: searchEnum.barImage),
            tag: 0
        )
        
        let nib = UINib(nibName: SearchTableViewCell.id, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: SearchTableViewCell.id)
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .onDrag
        
        setSegmentedControl()
        setTextField()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setSegmentedControl() {
        searchSegmentedControl
            .setTitleTextAttributes(
                [.font: UIFont.systemFont(ofSize: 14, weight: .black)],
                for: .selected
            )
        for order in 0..<segmentTitleList.count {
            searchSegmentedControl
                .setTitle(segmentTitleList[order], forSegmentAt: order)
        }
    }
    
    func setTextField() {
        searchTextField.placeholder = "도시 이름을 입력해주세요."
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredInfo.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: SearchTableViewCell.id,
            for: indexPath
        ) as! SearchTableViewCell
        
        cell.cityImage.kf.setImage(with: URL(string: filteredInfo[indexPath.row].city_image), placeholder: UIImage(systemName: "photo"))
        
        cell.cityName.text = filteredInfo[indexPath.row].getTitle
        
        cell.cityExplain.text = " " + filteredInfo[indexPath.row].city_explain

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.frame.height / 5
    }

    @IBAction func setFilter(_ sender: UISegmentedControl) {
        filteringInfo()
    }
    
    @IBAction func EnterTextField(_ sender: UITextField) {
        filteringInfo()
    }
    
    @IBAction func EditTextField(_ sender: UITextField) {
        filteringInfo()
    }
    
    func filteringInfo() {
        switch searchSegmentedControl.selectedSegmentIndex {
        case 1:
            filteredInfo = allInfo.filter { $0.domestic_travel
            }
        case 2:
            filteredInfo = allInfo.filter { !$0.domestic_travel
            }
        default:
            filteredInfo = allInfo
        }
        
        let searchText = returnSearchText(searchTextField.text ?? "")
        if let searchText {
            filteredInfo = filteredInfo
                .filter { $0.city_name.lowercased().contains(searchText) || $0.city_english_name.lowercased().contains(searchText) || $0.city_explain.lowercased().contains(searchText)
                }
        }
    }
    
    func returnSearchText(_ text: String) -> String? {
        var returnText = text.lowercased()
        returnText = returnText.trimmingCharacters(in: .whitespaces)
        
        if returnText.count != 0 {
            return returnText
        } else {
            return nil
        }
    }
}
