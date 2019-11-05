//
//  SignupViewController.swift
//  VirtualTradeshow
//
//  Created by Isaac Ballas on 2019-11-05.
//  Copyright © 2019 Isaacballas. All rights reserved.
//

import UIKit
import Firebase
class SignupViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var companyNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup button
        submitButton.layer.cornerRadius = 20.0
    }
    
    
    // MARK: - Actions
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        // Check if each field is filled in
        
        guard
            let companyName     = companyNameTextField.text,
            let firstName       = firstNameTextField.text,
            let lastName        = lastNameTextField.text,
            let email           = emailTextField.text,
            let phoneNumber     = phoneNumberTextField.text,
            let password        = passwordTextField.text,
            let confirmPassword = confirmPasswordTextField.text
            else { return }
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            guard let user = result?.user, error == nil else { return }
            Auth.auth().signIn(withEmail: email, password: password)
            print("*** \(user.email) created successfully")
            self.dismiss(animated: true, completion: nil)
        }
        
    }
}
/*
 Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error == nil {
                Auth.auth().signIn(withEmail: email, password: password)
            }
        }
        
 */
