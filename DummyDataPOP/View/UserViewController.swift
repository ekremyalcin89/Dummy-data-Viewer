//
//  ViewController.swift
//  DummyDataPOP
//
//  Created by Ekrem on 3.12.2022.
//

import UIKit

class UserViewController: UIViewController {
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let userNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let emailLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchUsers()
    }
        
        private func setupView() {
            
            view.backgroundColor = .yellow

            view.addSubview(nameLabel)
            view.addSubview(userNameLabel)
            view.addSubview(emailLabel)
            
            
            
            NSLayoutConstraint.activate(
                [
                    nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    nameLabel.heightAnchor.constraint(equalToConstant: 60),
                    nameLabel.widthAnchor.constraint(equalToConstant: 200),
                    nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                    
                    emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    emailLabel.heightAnchor.constraint(equalToConstant: 60),
                    emailLabel.widthAnchor.constraint(equalToConstant: 200),
                    emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
                    
                    userNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    userNameLabel.heightAnchor.constraint(equalToConstant: 60),
                    userNameLabel.widthAnchor.constraint(equalToConstant: 200),
                    userNameLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10)
                    
                    
                ]
                
            )
            nameLabel.text = "name label"
            emailLabel.text = "email"
            userNameLabel.text = "username"
            
            
        }
        
    private func fetchUsers() {
        APIManager.shared.fetchUser { result in
            switch result {
            case .success(let user):
                self.userNameLabel.text = user.username
                self.emailLabel.text = user.email
                self.nameLabel.text = user.name
                
            case.failure:
                self.nameLabel.text = "no user found"
            }
        }
    }
        
}

