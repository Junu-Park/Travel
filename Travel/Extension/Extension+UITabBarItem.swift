//
//  Extension+UITabBarItem.swift
//  Travel
//
//  Created by 박준우 on 1/3/25.
//

import UIKit

extension UITabBarItem {
    func setItem(order: Int) {
        var name = ""
        if order == 0 {
            name = "magazine"
        } else if order == 1 {
            name = "paperplane"
        } else if order == 2 {
            name = "cart"
        }
        
        self.title = name
        self.image = UIImage(systemName: name)
        self.selectedImage = UIImage(systemName: name + ".fill")
    }
}
