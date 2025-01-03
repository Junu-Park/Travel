//
//  TravelTabBarController.swift
//  Travel
//
//  Created by 박준우 on 1/3/25.
//

import UIKit

class TravelTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = .orange
        for order in 0..<self.tabBar.items!.count {
            self.tabBar.items![order].setItem(order: order)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
