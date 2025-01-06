//
//  TravelTabBarController.swift
//  Travel
//
//  Created by 박준우 on 1/3/25.
//

import UIKit

class TravelTabBarController: UITabBarController {

    // TODO: viewDidLoad에서 tabBar.items를 수정하면 수정되는데 awakeFromNib에서 수정하면 적용 안되는 이유??? tabBar.tintColor는 수정이 되네...?
    // => 추측: TabBarController라서 tabBar가 embed된 상태라서?, tabBar.items는 embed된 상태가 아니라서?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tabBar.tintColor = .orange
//        for order in 0..<self.tabBar.items!.count {
//            self.tabBar.items![order].setItem(order: order)
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBar.tintColor = .orange
//        for order in 0..<self.tabBar.items!.count {
//            self.tabBar.items![order].setItem(order: order)
//        }
    }
}
