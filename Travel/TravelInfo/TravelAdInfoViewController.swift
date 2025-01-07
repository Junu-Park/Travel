//
//  TravelAdInfoViewController.swift
//  Travel
//
//  Created by 박준우 on 1/7/25.
//

import UIKit

class TravelAdInfoViewController: UIViewController {

    @IBOutlet weak var adLabel: UILabel!
    
    var ad: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "광고 화면"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationItem.scrollEdgeAppearance = appearance
        let leftButton = UIBarButtonItem(image: .init(systemName: "xmark"), style: .plain, target: self, action: #selector(tapClose))
        navigationItem.setLeftBarButton(leftButton, animated: true)
        
        setLabel()
    }
    
    func setLabel() {
        adLabel.numberOfLines = 0
        adLabel.textAlignment = .center
        adLabel.font = .boldSystemFont(ofSize: 32)
        
        adLabel.text = ad
    }
    
    @objc func tapClose() {
        dismiss(animated: true)
    }
}
