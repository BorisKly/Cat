//
//  ViewController.swift
//  Cat
//
//  Created by Borys Klykavka on 11.01.2025.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let usersListVC = UsersListViewController()
        let authVC = AuthViewController()
        
        usersListVC.tabBarItem = UITabBarItem(title: Constants.users.localized, image: UIImage(systemName: "house"), tag: 0)
        authVC.tabBarItem = UITabBarItem(title: Constants.signUp.localized, image: UIImage(systemName: "gear"), tag: 1)
        
        viewControllers = [
            usersListVC,
            authVC
        ]
    }
}
