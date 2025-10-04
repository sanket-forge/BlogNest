//
//  AuthViewModel.swift
//  BlogNest
//
//  Created by Sanket Khatua on 04/10/25.
//

import Foundation

import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn

class AuthViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var isLoggedIn = false
    @Published var isSiggnedUp = false
    @Published var isSignedWithGoogle = false
    
    func signUp() {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if error == nil {
                
                return self.isSiggnedUp = true
            }
        }
    }
    
    func logIn() {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if error == nil {
                
                return self.isLoggedIn = true
            }
        }
    }
    
    func signInWithGoogle() {
        
        guard let clientID = FirebaseApp.app()?.options.clientID,
              let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootVC = windowScene.windows.first?.rootViewController else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootVC) { result, error in
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString else {
                return
            }
            
            let accessToken = user.accessToken.tokenString
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            
            Auth.auth().signIn(with: credential) { _, error in
                if error == nil {
                    self.isSignedWithGoogle = true
                }
            }
        }
    }
    
    func forgotPassword() {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            
            if let error = error {
                
                print("Password reset failed: \(error.localizedDescription)")
            } else {
                
                print("Password reset email sent.")
            }
        }
    }
}
