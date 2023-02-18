//
//  FirebaseLoginManager.swift
//  galpi
//
//  Created by minsson on 2023/02/18.
//

import FirebaseAuth

final class FirebaseLoginManager: ServerLoginManagerInterface {
    
    var shouldSignIn: Bool {
        return Auth.auth().currentUser != nil ? false : true
    }
    
    func signIn(with concreteSocialLoginManager: SocialLoginManagerInterface, completion: @escaping (Result<Bool, Error>) -> Void) {
        concreteSocialLoginManager.signIn { credentialResult in
            switch credentialResult {
            case .success(let socialAuthcredential):
                let firebaseCredential = self.firebaseCredential(socialAuthCredential: socialAuthcredential)
                
                Auth.auth().signIn(with: firebaseCredential) { (authResult, error) in
                  if let error {
                    print(error)
                    return
                  }
   
                    completion(.success(true))
                }
    
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func firebaseCredential(socialAuthCredential: SocialLoginCredential) -> OAuthCredential {
        let firebaseCredential = OAuthProvider.credential(
            withProviderID: socialAuthCredential.providerID,
            idToken: socialAuthCredential.token,
            rawNonce: socialAuthCredential.nonce
        )
        
        return firebaseCredential
    }
    
}
