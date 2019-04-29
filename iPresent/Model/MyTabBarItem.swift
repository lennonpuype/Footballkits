//
//  MyTabBarItem.swift
//  MyTabBar Playground
//
//  Created by Kyle Melton on 8/6/17.
//  Copyright © 2017 Kyle Melton. All rights reserved.
//

import UIKit

@IBDesignable
class MyTabBarItem: UITabBarItem {
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    func setup() {
        if let image = image {
            self.image = image.withRenderingMode(.alwaysOriginal)
        }
        if let image = selectedImage {
            selectedImage = image.withRenderingMode(.alwaysOriginal)
        }
        
    }
}
