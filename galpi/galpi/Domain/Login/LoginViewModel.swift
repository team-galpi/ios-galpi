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
    
    init(serverLoginManager: ServerLoginManagerProtocol) {
        self.serverLoginManager = serverLoginManager
        
        shouldSignIn = serverLoginManager.shouldSignIn
    }
    
    func appleLoginButtonTapped() {
        executeServerLogin(with: .apple)
    }
    
    private func executeServerLogin(with socialLogin: SocialLogin) {
        serverLoginManager.signIn(with: socialLogin) { boolResult in
            switch boolResult {
            case .success:
                self.shouldSignIn = false
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
