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
    private var signInCompletion: ((Result<SocialLoginCredential, Error>) -> Void)?
    
    func signIn(completion: @escaping (Result<SocialLoginCredential, Error>) -> Void) {
        configureAuthorizationController()
        
        signInCompletion = completion
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
            
            let appleLoginCredential = SocialLoginCredential(providerID: "apple.com", token: idTokenString, nonce: nonce)
            signInCompletion?(.success(appleLoginCredential))
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Sign in with Apple errored: \(error)")
    }
    
}
