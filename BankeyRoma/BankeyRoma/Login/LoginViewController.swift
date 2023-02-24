//
//  ViewController.swift
//  BankeyRoma
//
//  Created by Ramazan Amangeldin on 20/02/2023.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    let mainTitle = UILabel()
    let titleLabelText = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    private func style() {
        
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        mainTitle.textColor = .systemBlue
        mainTitle.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        mainTitle.textAlignment = .center
        mainTitle.text = "Bankey"
        
        
        titleLabelText.translatesAutoresizingMaskIntoConstraints = false
        titleLabelText.textColor = .black
        titleLabelText.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabelText.textAlignment = .center
        titleLabelText.text = "Your premium source for all things banking!"
        titleLabelText.numberOfLines = 0
        
    
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 // for indicator spacing
        signInButton.setTitle("Sign in", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = false
        
    
        
    }
    
    private func layout() {
        
        view.addSubview(mainTitle)
        view.addSubview(titleLabelText)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        //MainTitle
        NSLayoutConstraint.activate([
            mainTitle.bottomAnchor.constraint(equalTo: titleLabelText.topAnchor, constant: -50),
            mainTitle.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            mainTitle.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        //TitleLabelText
        NSLayoutConstraint.activate([
            titleLabelText.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -50),
            titleLabelText.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            titleLabelText.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        
        // LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        // Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // ErrorLabel
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / password cannot be blank")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / password cannot be blank")
            return
        }
        
        if username == "Ramazan" && password == "Irgiz" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect username / password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
