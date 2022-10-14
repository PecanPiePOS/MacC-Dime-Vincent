//
//  TabbarViewController.swift
//  Vincent
//
//  Created by COBY_PRO on 2022/10/06.
//

import UIKit

class TabbarViewController: UITabBarController {
    
    private let mainViewController = UINavigationController(rootViewController: HomeViewController())
    private let sellViewController = UINavigationController(rootViewController: SellViewController())
    private let messageViewController = UINavigationController(rootViewController: MessageViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainViewController.tabBarItem.image = ImageLiteral.btnHome
        mainViewController.tabBarItem.title = "홈"
        
        // TODO: Modally Present
        sellViewController.tabBarItem.image = ImageLiteral.btnEnroll
        sellViewController.tabBarItem.title = "등록"
        
        messageViewController.tabBarItem.image = ImageLiteral.btnProfile
        messageViewController.tabBarItem.title = "메세지"
        
        tabBar.tintColor = .mainYellow
        tabBar.backgroundColor = .white
        setViewControllers([mainViewController, sellViewController, messageViewController], animated: true)
        
        self.delegate = self
    }
    
}

extension TabbarViewController: UITabBarControllerDelegate {

//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        print("@@")
//        if viewController == sellViewController {
//            print("dfdf")
//            viewController.modalPresentationStyle = .overFullScreen
//            viewController.present(sellViewController, animated: true)
//        }
//    }
    
}
