//
//  AppleLoginManager.swift
//  galpi
//
//  Created by minsson on 2023/02/17.
//

import Foundation
import AuthenticationServices
import FirebaseAuth

final class AppleLoginManager: NSObject {
    
    private let nonce = AuthSecurityService().randomNonceString()
    
    func startSignInWithAppleFlow() {
        configureAuthorizationController()
    }
    
    private func configureAuthorizationController() {
        let authorizationController = ASAuthorizationController(authorizationRequests: [request(with: nonce)])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
    
    private func request(with nonce: String) -> ASAuthorizationAppleIDRequest {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = AuthSecurityService().sha256(nonce)
        
        return request
    }
    
}

extension AppleLoginManager: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
      if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
        guard let appleIDToken = appleIDCredential.identityToken else {
          print("Unable to fetch identity token")
          return
        }
        guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
          print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
          return
        }
        // Initialize a Firebase credential.
        let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                  idToken: idTokenString,
                                                  rawNonce: nonce)
        // Sign in with Firebase.
        Auth.auth().signIn(with: credential) { (authResult, error) in
          if let error {
            // Error. If error.code == .MissingOrInvalidNonce, make sure
            // you're sending the SHA256-hashed nonce as a hex string with
            // your request to Apple.
            print(error.localizedDescription)
            return
          }
          // User is signed in to Firebase with Apple.
          // ...
        }
      }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
      // Handle error.
      print("Sign in with Apple errored: \(error)")
    }
    
}
