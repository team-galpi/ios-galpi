//
//  AuthenticationViewModel.swift
//  galpi
//
//  Created by minsson on 2023/02/12.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var isSignedIn = false

    private let authManager = FirebaseLoginManager()
    private let socialLoginManager = AppleLoginManager()
        
    func appleLoginButtonTapped() {
        executeServerLogin()
    }
    
    private func executeServerLogin() {
        authManager.signIn(with: socialLoginManager) { boolResult in
            switch boolResult {
            case .success:
                self.isSignedIn = true
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
