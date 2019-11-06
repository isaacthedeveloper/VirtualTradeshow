//
//  ViewController.swift
//  VirtualTradeshow
//
//  Created by Isaac Ballas on 2019-11-05.
//  Copyright © 2019 Isaacballas. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var signupButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup button
        submitButton.layer.cornerRadius = 20.0
        signupButton.layer.cornerRadius = 20.0

        Auth.auth().addStateDidChangeListener { (auth, user) in
            if Auth.auth().currentUser != nil {
                // User is signed in
                self.performSegue(withIdentifier: "Login", sender: nil)
                self.emailTextField.text = nil
                self.passwordTextField.text = nil
            } else {
                // No user is signed in
                self.becomeFirstResponder()
            }
        }
        
    }
    
    // MARK: - Actions
    @IBAction func submitButtonTapped(_ sender: UIButton) {
         guard let email = emailTextField.text, let password = passwordTextField.text, email.count > 0, password.count > 0 else { return }
               // Authentication
               Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                   if let error = error, user == nil {
                       let alert = UIAlertController(title: "Sign In Failed", message: error.localizedDescription, preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "OK", style: .default))
                       self.present(alert, animated: true, completion: nil)
                   }
               }
    }


}

