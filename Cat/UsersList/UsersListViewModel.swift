//
//  UsersListViewModel.swift
//  Cat
//
//  Created by Borys Klykavka on 11.01.2025.
//

import Foundation

class UsersListViewModel {
    
    let model = UsersListModel()
    var users: [ResponseUser] = []
    var page = 1
    
    var reloadTableView: (() -> Void)?
    
    init() {
        print("UsersListViewModel init")
//        users = model.plugUsers
       fetchUsers(page: page)
    }
    
    deinit {
        print("UsersListViewModel deinited!")
    }
    
    func fetchUsers(page: Int) {
        
        let data = createRequestData(page: page)

        NetworkService.shared.getUsers(data: data, settings: nil) { result in
            switch result {
            case .success(let result):
                let json = result.json
                print(json)
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
                    let usersResponseData = try JSONDecoder().decode(UsersResponseData.self, from: jsonData)
                    DispatchQueue.main.async {
                        self.users = usersResponseData.users
                        self.reloadTableView?()
//                        self.totalPages = usersResponseData.totalPages
//                        self.totalUsers = usersResponseData.totalUsers
                    }
                } catch {
                    print("Error decoding UsersResponseData: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func createRequestData(page: Int) -> [String: Any] {
        let data: [String: Any] = [
            "queryParams": [
                "page": String(page),
                "count": String(model.numberOfUsersPerPage)
            ]
        ]
        return data
    }
    
}
