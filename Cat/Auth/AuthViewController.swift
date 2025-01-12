//
//  AuthViewController.swift
//  Cat
//
//  Created by Borys Klykavka on 11.01.2025.
//

import UIKit

class AuthViewController: UIViewController {
    var activityIndicator = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        // Do any additional setup after loading the view.
        setupActivityIndicator()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        activityIndicator.startAnimating()
    }
    private func setupActivityIndicator() {
          activityIndicator = UIActivityIndicatorView(style: .large)
          activityIndicator.color = .gray
          
          // Додаємо activity indicator до таблиці
          view.addSubview(activityIndicator)
          
          // Використовуємо SnapKit для розміщення індикатора внизу таблиці
          activityIndicator.snp.makeConstraints { make in
              make.centerX.equalToSuperview() // Центруємо по горизонталі
              make.bottom.equalToSuperview().inset(150) // Відступ 10 пікселів віднизу таблиці
          }
      }
}
