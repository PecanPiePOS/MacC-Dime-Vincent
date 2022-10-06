//
//  TabbarViewController.swift
//  Vincent
//
//  Created by COBY_PRO on 2022/10/06.
//

import UIKit

class TabbarViewController: UITabBarController {
    
    private let mainViewController = UINavigationController(rootViewController: MainViewController())
    private let searchViewController = UINavigationController(rootViewController: SearchViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainViewController.tabBarItem.image = ImageLiteral.btnHome
        mainViewController.tabBarItem.title = "홈"
        
        searchViewController.tabBarItem.image = ImageLiteral.btnSearch
        searchViewController.tabBarItem.title = "검색"
        
        tabBar.tintColor = .red
        tabBar.backgroundColor = .white
        setViewControllers([mainViewController, searchViewController], animated: true)
    }
}
