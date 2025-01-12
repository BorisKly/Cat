//
//  UsersListViewController.swift
//  Cat
//
//  Created by Borys Klykavka on 11.01.2025.
//

import UIKit
import SnapKit

class UsersListViewController: UIViewController{
    
    let viewModel = UsersListViewModel()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.identifier)
        return tableView
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        viewModel.reloadTableView = { [weak self] in
            self?.tableView.reloadData()
        }
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        view.backgroundColor = .cyan
    }
}

extension UsersListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = viewModel.users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
        cell.configure(with: user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = viewModel.users[indexPath.row]
        print("Selected user: \(user.name)")
    }
    
}
