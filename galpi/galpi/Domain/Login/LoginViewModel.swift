//
//  AuthenticationViewModel.swift
//  galpi
//
//  Created by minsson on 2023/02/12.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published private(set) var shouldSignIn = true
    
    private let serverLoginManager: ServerLoginManagerProtocol
    private var socialLoginManager: SocialLoginManagerProtocol?
    
    init(serverLoginManager: ServerLoginManagerProtocol = FirebaseLoginManager()) {
        self.serverLoginManager = serverLoginManager
        
        shouldSignIn = serverLoginManager.shouldSignIn
    }
    
    func appleLoginButtonTapped() {
        socialLoginManager = AppleLoginManager()
        executeServerLogin()
    }
    
    private func executeServerLogin() {
        guard let socialLoginManager = socialLoginManager else {
            return
        }
        
        serverLoginManager.signIn(with: socialLoginManager) { boolResult in
            switch boolResult {
            case .success:
                self.shouldSignIn = false
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
