//
//  AuthManager.swift
//  FakeFacetime
//
//  Created by Nhấc tay khỏi Mac của tao on 21/5/24.
//

import Foundation
import UIKit
import FirebaseAuth

class AuthManager {
    
    static let shared = AuthManager()
    
    var isSignIn: Bool {
        return Auth.auth().currentUser != nil
    }
    
    //Check fake
    func signInHardCode(email: String, password: String, completion: @escaping (Bool) -> Void) {
        if email == "abc123@gmail.com" && password == "123456" {
            completion(true)
            CallManager.shared.setup(email: email)
        } else {
            completion(false)
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error == nil {
                CallManager.shared.setup(email: email)
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    
    func signUp(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error == nil {
//                CallManager.shared.setup(email: email)
                print("User signed up successfully")
            } else {
//                print(error?.localizedDescription)
            }
        }
        
    }
    
    func signOut() {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
            } catch {
                print(error)
            }
        } else {
            
        }
    }
}
