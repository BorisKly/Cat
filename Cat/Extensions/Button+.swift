//
//  Button+.swift
//  Cat
//
//  Created by Borys Klykavka on 11.01.2025.
//

import UIKit

extension UIButton {
    
    static func mainButton(title: String, target: Any?, action: Selector) -> UIButton {
         let button = UIButton(type: .system)
         button.backgroundColor = .systemBlue
         button.setTitle(title, for: .normal)
         button.setTitleColor(.white, for: .normal)
         button.layer.cornerRadius = 10
         button.addTarget(target, action: action, for: .touchUpInside)
         return button
     }
    
    static func additionalButton(title: String, target: Any?, action: Selector) -> UIButton {
           let button = UIButton(type: .system)
           button.setTitle(title, for: .normal)
           button.setTitleColor(.systemBlue, for: .normal)
           button.layer.cornerRadius = 10
           button.layer.borderWidth = 1
           button.layer.borderColor = UIColor.systemBlue.cgColor
           button.addTarget(target, action: action, for: .touchUpInside)
           return button
       }
}
