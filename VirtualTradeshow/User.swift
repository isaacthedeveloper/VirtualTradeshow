
//  User.swift
//  VirtualTradeshow
//
//  Created by Isaac Ballas on 2019-11-05.
//  Copyright © 2019 Isaacballas. All rights reserved.
//

import Foundation
import Firebase

struct User {
  let uid: String
  let email: String
  
  init(authData: Firebase.User) {
    uid = authData.uid
    email = authData.email!
  }
  
  init(uid: String, email: String) {
    self.uid = uid
    self.email = email
  }
}
