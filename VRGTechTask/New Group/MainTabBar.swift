//
//  MainTabBar.swift
//  VRGTechTask
//
//  Created by Anton Honcharenko on 6/26/19.
//  Copyright © 2019 Anton Honcharenko. All rights reserved.
//

import UIKit

class MainTabBar: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.viewControllers = [NewsViewController.create(contentType: .emailed),
                                NewsViewController.create(contentType: .shared),
                                NewsViewController.create(contentType: .viewed)]
        title = selectedViewController?.title
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        title = viewController.title
    }
    
    
    
}
