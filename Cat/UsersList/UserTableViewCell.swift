//
//  UserTableViewCell.swift
//  Cat
//
//  Created by Borys Klykavka on 11.01.2025.
//

import UIKit
import SnapKit

class UserTableViewCell: UITableViewCell {

    static let identifier = "UserTableViewCell"
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "photo")
        return imageView
    }()
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "name"
        label.font = Fonts.customBody2
        label.textColor = .txtColor
        return label
    }()
    
    private let positionLabel : UILabel = {
        let label = UILabel()
        label.text = "position"
        label.font = Fonts.customBody3
        label.textColor = .txtColor
        return label
    }()
    
    private let emailLabel : UILabel = {
        let label = UILabel()
        label.text = "email"
        label.font = Fonts.customBody1
        label.textColor = .txtColor
        return label
    }()
    
    private let phoneLabel : UILabel = {
        let label = UILabel()
        label.text = "phone"
        label.font = Fonts.customBody1
        label.textColor = .txtColor
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(positionLabel)
        contentView.addSubview(emailLabel)
        contentView.addSubview(phoneLabel)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with user: ResponseUser) {
        nameLabel.text = user.name
        positionLabel.text = user.position
        emailLabel.text = user.email
        phoneLabel.text = user.phone
        setProfileImage(from: user.photo)
     }
    
    private func setProfileImage(from urlString: String) {
        print(#function)
        guard let url = URL(string: urlString) else {
            print("wrong URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("Error loading: \(error)")
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                print("Imposible create image")
                return
            }
            
            DispatchQueue.main.async {
                self?.profileImageView.image = image
            }
        }
        .resume()
    }
    
    private func setupView() {
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(positionLabel)
        addSubview(emailLabel)
        addSubview(phoneLabel)
        
        profileImageView.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.top.equalToSuperview().offset(24)
            make.left.equalToSuperview().offset(16)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.left.equalTo(profileImageView.snp.right).offset(16)
            make.right.equalToSuperview().offset(-24)
        }
        positionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.left.equalTo(nameLabel)
            make.right.equalTo(nameLabel)
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(positionLabel.snp.bottom).offset(8)
            make.left.equalTo(nameLabel)
            make.right.equalTo(nameLabel)
        }
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(4)
            make.left.equalTo(nameLabel)
            make.right.equalTo(nameLabel)
            make.bottom.equalToSuperview().offset(-24)
        }
    }
}
