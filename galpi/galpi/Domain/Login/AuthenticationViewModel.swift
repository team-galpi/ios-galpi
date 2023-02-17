//
//  AuthenticationViewModel.swift
//  galpi
//
//  Created by minsson on 2023/02/12.
//

import Foundation

import CryptoKit
import AuthenticationServices

import FirebaseAuth

final class AuthenticationViewModel: ObservableObject {
    
    private var currentNonce: String?

}

extension AuthenticationViewModel {
    
    func handleSignInWithAppleRequest(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName]
        let authSecurityService = AuthSecurityService()
        let nonce = authSecurityService.randomNonceString()
        currentNonce = nonce
        request.nonce = authSecurityService.sha256(nonce)
    }
    
    func handleSignInWithAppleCompletion(_ result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let asAuth):
            guard let appleIDCredential = asAuth.credential as? ASAuthorizationAppleIDCredential else {
                return
            }
            
            guard let nonce = currentNonce else {
                fatalError("Invalid state: a login callback was received, but no login request was sent.")
            }
            
            guard let appleIDToken = appleIDCredential.identityToken,
                  let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to fetch identify token or Unable to serialise token string from data")
                return
            }
            
            let firebaseAuthCredential = OAuthProvider.credential(
                withProviderID: "apple.com",
                idToken: idTokenString,
                rawNonce: nonce
            )
            
            Task {
                do {
                    try await Auth.auth().signIn(with: firebaseAuthCredential)
                }
                catch {
                    print("Error authenticating: \(error.localizedDescription)")
                }
            }
        case .failure(let failure):
            // TODO: 에러 핸들링
            print(failure)
        }
    }
    
}
