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
    var activityIndicator = UIActivityIndicatorView()
    
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
        setupActivityIndicator()
    }
    
    private func setupActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .red
        
        view.addSubview(activityIndicator)

        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().inset(180)
        }
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
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let threshold = scrollView.contentSize.height - scrollView.frame.height
        if (scrollView.contentOffset.y > threshold) && viewModel.nextPageAvailiable {
            activityIndicator.startAnimating()
            tableView.isScrollEnabled = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.viewModel.page += 1
                self.viewModel.fetchUsers(page: self.viewModel.page)
                self.activityIndicator.stopAnimating()
                self.tableView.isScrollEnabled = true
            }
        }
    }
}
