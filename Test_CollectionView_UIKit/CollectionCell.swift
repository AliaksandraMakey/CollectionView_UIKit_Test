//
//  CollectionCell.swift
//  Test_CollectionView_UIKit
//
//  Created by Александра Макей on 13.12.2023.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    //MARK: -  UI Components
    var nameLabel: UILabel!
    var userNameLabel: UILabel!
    var eMailLabel: UILabel!
    var addressLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with user: User) {
        nameLabel.text = "Name: \(user.name)"
        userNameLabel.text = "Username: \(user.username)"
        eMailLabel.text = "Email: \(user.email)"
        addressLabel.text = "Address: \(user.address.street), \(user.address.suite), \(user.address.city), \(user.address.zipcode)"
    }
    //MARK: - Setup UI
    private func setupUI() {
        self.accessibilityIdentifier = "Cell"
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        userNameLabel = UILabel()
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(userNameLabel)
        
        eMailLabel = UILabel()
        eMailLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(eMailLabel)
        
        addressLabel = UILabel()
        addressLabel.numberOfLines = 0
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(addressLabel)
        
        setupConstraints()
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            userNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            userNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            eMailLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 5),
            eMailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            eMailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            addressLabel.topAnchor.constraint(equalTo: eMailLabel.bottomAnchor, constant: 5),
            addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            addressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            addressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
