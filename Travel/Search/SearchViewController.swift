//
//  SearchViewController.swift
//  Travel
//
//  Created by 박준우 on 1/8/25.
//

import UIKit
import Kingfisher

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var searchSegment: UISegmentedControl!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    let segmentTitleList = ["모두", "국내", "해외"]
    
    let searchEnum = TravelEnum.search
    
    let allInfo = CityInfo.city
    
    var filteredInfo = CityInfo.city {
        didSet {
            searchCollectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setNavigationItem()
        setTabBarItem()
        print("SearchViewController awakeFromNib", searchSegment)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        
        setSegmentedControl()
        setTextField()
        setCell()
        setCollectionView()
    }
    
    func setCell() {
        let xib = UINib(nibName: "SearchCollectionViewCell", bundle: nil)
        searchCollectionView.register(xib, forCellWithReuseIdentifier: "SearchCollectionViewCell")
    }
    
    func setTabBarItem() {
        tabBarItem = .init(
            title: searchEnum.barTitle,
            image: .init(systemName: searchEnum.barImage),
            tag: 0
        )
    }
    
    func setNavigationItem() {
        navigationItem.title = searchEnum.naviTitle
        
    }
    
    func setSegmentedControl() {
        searchSegment
            .setTitleTextAttributes(
                [.font: UIFont.systemFont(ofSize: 14, weight: .black)],
                for: .selected
            )
        for order in 0..<segmentTitleList.count {
            searchSegment
                .setTitle(segmentTitleList[order], forSegmentAt: order)
        }
    }
    
    func setTextField() {
        searchTextField.placeholder = "도시 이름을 입력해주세요."
    }
    
    func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: searchCollectionView.frame.size.width / 2, height: searchCollectionView.frame.size.height / 2)
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        searchCollectionView.collectionViewLayout = layout
        
        searchCollectionView.keyboardDismissMode = .onDrag
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        
        cell.cellImage.kf.setImage(with: URL(string: filteredInfo[indexPath.row].city_image))
        cell.cellImage.layer.cornerRadius = 80
        cell.cellTitle.text = filteredInfo[indexPath.row].getTitle
        cell.cellSubTitle.text = filteredInfo[indexPath.row].city_explain
        
        return cell
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
        switch searchSegment.selectedSegmentIndex {
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
