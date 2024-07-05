//
//  AuthenticationManager.swift
//  BiblioFi
//
//  Created by Vineet Chaudhary on 04/07/24.
//

//import SwiftUI
//import FirebaseAuth
//
//struct AuthDataResult {
//    let uid: String
//    let email: String?
//    let photoUrl: String?
//    
//    init(user: User) {
//        self.uid = user.uid
//        self.email = user.email
//        self.photoUrl = user.photoURL?.absoluteString
//    }
//}
//
//final class AuthenticationManager {
//    static let shared = AuthenticationManager()
//    private init() { }
//    
//    func createUser(email: String, password: String) async throws -> AuthDataResult {
//        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
//        return AuthDataResult(user: authDataResult.user)
//    }
//    
//    func loginUser(email: String, password: String) async throws -> AuthDataResult {
//        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
//        return AuthDataResult(user: authDataResult.user)
//    }
//}



//last working
//import FirebaseAuth
//
//class AuthenticationManager {
//    static let shared = AuthenticationManager()
//
//    private init() {}
//
//    func loginUser(email: String, password: String) async throws -> User {
//        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
//        return authResult.user
//    }
//
//    func createUser(email: String, password: String) async throws -> User {
//        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
//        return authResult.user
//    }
//
//    func logoutUser() throws {
//        try Auth.auth().signOut()
//    }
//}


//last working
//import FirebaseAuth
//import FirebaseFirestore
//
//class AuthenticationManager {
//    static let shared = AuthenticationManager()
//    private let db = Firestore.firestore()
//
//    private init() {}
//
//    func loginUser(email: String, password: String) async throws -> User {
//        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
//        return authResult.user
//    }
//
//    func createUser(email: String, password: String, fullName: String, phoneNumber: String) async throws -> User {
//        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
//        let user = authResult.user
//        
//        // Store additional user data in Firestore
//        try await db.collection("users").document(user.uid).setData([
//            "fullName": fullName,
//            "email": email,
//            "phoneNumber": phoneNumber
//        ])
//        
//        return user
//    }
//
//    func logoutUser() throws {
//        try Auth.auth().signOut()
//    }
//}


import FirebaseAuth
import FirebaseFirestore

class AuthenticationManager {
    static let shared = AuthenticationManager()
    private let db = Firestore.firestore()

    private init() {}

    func loginUser(email: String, password: String) async throws -> User {
        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
        setLoggedIn()
        return authResult.user
    }

    func createUser(email: String, password: String, fullName: String, phoneNumber: String) async throws -> User {
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let user = authResult.user
        
        // Store additional user data in Firestore
        try await db.collection("users").document(user.uid).setData([
            "fullName": fullName,
            "email": email,
            "phoneNumber": phoneNumber
        ])
        
        setLoggedIn()
        return user
    }

    func logoutUser() throws {
        try Auth.auth().signOut()
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
    }

    private func setLoggedIn() {
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
    }
} 
