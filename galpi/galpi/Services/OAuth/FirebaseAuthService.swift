//
//  FirebaseLoginManager.swift
//  galpi
//
//  Created by minsson on 2023/02/18.
//

import FirebaseAuth

protocol ServerAuthServiceProtocol {
    
    var isSignedIn: Bool { get }
    func signIn(with socialLogin: SocialLogin, completion: @escaping (Result<Bool, ServerAuthError>) -> Void)
    
}

final class FirebaseAuthService: ServerAuthServiceProtocol {
    
    var isSignedIn: Bool {
        return Auth.auth().currentUser == nil ? false : true
    }
    
    var socialLoginManager: SocialLoginManagerProtocol?

    func signIn(with socialLogin: SocialLogin, completion: @escaping (Result<Bool, ServerAuthError>) -> Void) {
        socialLoginManager = socialLogin.loginManager
        
        socialLoginManager?.signIn { credentialResult in
            switch credentialResult {
            case .success(let socialAuthcredential):
                let firebaseCredential = self.firebaseCredential(socialAuthCredential: socialAuthcredential)
                
                Auth.auth().signIn(with: firebaseCredential) { (authResult, error) in
                    guard error == nil else {
                        completion(.failure(ServerAuthError.custom(error?.localizedDescription ?? "")))
                        return
                    }
                    
                    completion(.success(true))
                }
    
            case .failure(let error):
                completion(.failure(ServerAuthError.socialLoginError(error)))
            }
        }
    }
    
    private func firebaseCredential(socialAuthCredential: SocialLoginCredential) -> OAuthCredential {
        let firebaseCredential = OAuthProvider.credential(
            withProviderID: socialAuthCredential.socialLoginName.firebaseProviderID,
            idToken: socialAuthCredential.token,
            rawNonce: socialAuthCredential.nonce
        )
        
        return firebaseCredential
    }
    
}
