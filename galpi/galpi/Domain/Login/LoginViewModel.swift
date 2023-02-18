//
//  AuthenticationViewModel.swift
//  galpi
//
//  Created by minsson on 2023/02/12.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published private(set) var shouldSignIn = true
    
    private let authManager: FirebaseLoginManager
    private let socialLoginManager: AppleLoginManager
    
    init(authManager: FirebaseLoginManager = FirebaseLoginManager(), socialLoginManager: AppleLoginManager) {
        self.authManager = authManager
        self.socialLoginManager = socialLoginManager
        
        shouldSignIn = authManager.shouldSignIn
    }
    
    func appleLoginButtonTapped() {
        executeServerLogin()
    }
    
    private func executeServerLogin() {
        authManager.signIn(with: socialLoginManager) { boolResult in
            switch boolResult {
            case .success:
                self.shouldSignIn = false
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
