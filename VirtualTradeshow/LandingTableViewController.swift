//
//  LandingTableViewController.swift
//  VirtualTradeshow
//
//  Created by Isaac Ballas on 2019-11-06.
//  Copyright © 2019 Isaacballas. All rights reserved.
//

import UIKit
import Firebase
class LandingTableViewController: UITableViewController {
    var handle: AuthStateDidChangeListenerHandle?
    var user: User!
    let theDetail = DetailVCTest()
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            guard let user = user else { return }
            self.user = User(authData: user)
            self.tableView.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Remove the Auth Listener
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserProfiler()
    
    }
    
    func getUserProfiler() {
        let user = Auth.auth().currentUser
        if let user = user {
        let uid = user.uid
        print("The uid is \(uid)")
        let email = user.email
        print("the email is \(email)")
    }
    }
    
    
   // @IBAction func signOutButtonTapped(_ sender: UIBarButtonItem) {
//        let user = Auth.auth().currentUser!
//        let onlineRef = Database.database().reference(withPath: "online/\(user.uid)")
//        onlineRef.removeValue { (error, _) in
//            if let error = error {
//                print("Removing online failed: \(error)")
//                return
//            }
//            do {
//                try Auth.auth().signOut()
//                self.dismiss(animated: true, completion: nil)
//            } catch (let error) {
//                print("Auth sign out failed: \(error)")
//            }
//        }
    //}
    
    
    
}
