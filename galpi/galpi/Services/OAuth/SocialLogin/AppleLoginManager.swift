//
//  AppleLoginManager.swift
//  galpi
//
//  Created by minsson on 2023/02/17.
//

import Foundation
import AuthenticationServices
import FirebaseAuth

final class AppleLoginManager: NSObject, SocialLoginManagerProtocol {
    
    let nonce = NonceManager().randomNonceString()
    private var signInCompletion: ((Result<SocialLoginCredential, SocialLoginError>) -> Void)?
    
    func signIn(completion: @escaping (Result<SocialLoginCredential, SocialLoginError>) -> Void) {
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
        request.nonce = NonceManager().sha256(nonce)
        
        return request
    }
    
}

extension AppleLoginManager: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let appleIDToken = appleIDCredential.identityToken else {
                signInCompletion?(.failure(SocialLoginError.internalError))
                return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                signInCompletion?(.failure(SocialLoginError.idTokenString))
                return
            }
            
            let appleLoginCredential = SocialLoginCredential(socialLoginName: .apple, token: idTokenString, nonce: nonce)
            signInCompletion?(.success(appleLoginCredential))
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        guard let authError = error as? ASAuthorizationError else {
            return
        }
        
        switch authError.code {
        case .canceled:
            signInCompletion?(.failure(SocialLoginError.canceled))
        default:
            signInCompletion?(.failure(SocialLoginError.internalError))
        }
    }
    
}
