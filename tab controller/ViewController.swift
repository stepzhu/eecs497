//
//  ViewController.swift
//  tab controller
//
//  Created by Stephen Zhu on 10/6/19.
//  Copyright © 2019 Stephen Zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var homeViewController: HomeViewController!
    var faqViewController: FaqViewController!
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
}
class CustomTabBarController:  UITabBarController, UITabBarControllerDelegate {
    var homeViewController: HomeViewController!
    var faqViewController: FaqViewController!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.delegate = self
        homeViewController = HomeViewController()
        faqViewController = FaqViewController()
        homeViewController.tabBarItem.image = UIImage(named: "home")
        homeViewController.tabBarItem.selectedImage =
            UIImage(named: "home")
        
        faqViewController.tabBarItem.image = UIImage(named: "faq")
        faqViewController.tabBarItem.selectedImage =
            UIImage(named: "faq")
        viewControllers = [homeViewController, faqViewController]
        for tabBarItem in tabBar.items! {
            tabBarItem.title = ""
            tabBarItem.imageInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: -6, right: 0)
        }
        //MARK: UITabbar Delegate
        func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            if viewController.isKind(of: FaqViewController.self) {
                let vc =  FaqViewController()
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true, completion: nil)
                return false
            }
            return true
        }
    }
}
