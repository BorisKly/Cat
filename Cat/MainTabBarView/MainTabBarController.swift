//
//  MainTabBarController.swift
//  Cat
//
//  Created by Borys Klykavka on 11.01.2025.
//

import UIKit
import SnapKit

class MainTabBarController: UITabBarController {
    
    private let toolbar = UIToolbar()
    private let toolbarLabel = UILabel()
    private let toolbarHeight: CGFloat = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

        setupViewControllers()
        setupToolbar()
        updateToolbarLabel()
        adjustViewControllersInsets()
    }
    
    private func setupViewControllers() {
        
        let usersListVC = UsersListViewController()
        let authVC = AuthViewController()
        
        usersListVC.tabBarItem = UITabBarItem(title: Constants.users.localized, image: UIImage(systemName: "person.3.fill"), tag: 0)
        authVC.tabBarItem = UITabBarItem(title: Constants.signUp.localized, image: UIImage(systemName: "person.crop.circle.fill.badge.plus"), tag: 1)
        
        viewControllers = [
            usersListVC,
            authVC
        ]
    }
    
    private func adjustViewControllersInsets() {
          for viewController in viewControllers ?? [] {
                  viewController.additionalSafeAreaInsets.top += toolbarHeight
          }
      }
    
    private func setupToolbar() {
        toolbar.barStyle = .default
        toolbar.isTranslucent = false
        toolbar.barTintColor = .primColor

        view.addSubview(toolbar)
        
        toolbarLabel.textAlignment = .center
        toolbarLabel.font = Fonts.customHeading1
        toolbarLabel.textColor = .txtColor

        let labelItem = UIBarButtonItem(customView: toolbarLabel)
        toolbar.items = [
            UIBarButtonItem.flexibleSpace(),
            labelItem,
            UIBarButtonItem.flexibleSpace()
        ]
        
        toolbar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(toolbarHeight)
        }
    }
    
    private func updateToolbarLabel(){
        switch selectedIndex {
        case 0:
            toolbarLabel.text = Constants.workingWithGetRequest.localized
        case 1:
            toolbarLabel.text = Constants.workingWithPostRequest.localized
        default:
            toolbarLabel.text = "Tab"
        }
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        updateToolbarLabel()
    }
}
