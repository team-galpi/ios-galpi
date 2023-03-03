//
//  AuthenticationViewModel.swift
//  galpi
//
//  Created by minsson on 2023/02/12.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published private(set) var isSignedIn = false
    
    private let serverLoginManager: ServerLoginManagerProtocol
    
    init(serverLoginManager: ServerLoginManagerProtocol) {
        self.serverLoginManager = serverLoginManager
        
        isSignedIn = serverLoginManager.isSignedIn
    }
    
    func appleLoginButtonTapped() {
        executeServerLogin(with: .apple)
    }
    
    private func executeServerLogin(with socialLogin: SocialLogin) {
        serverLoginManager.signIn(with: socialLogin) { boolResult in
            switch boolResult {
            case .success(let isSignedIn):
                self.isSignedIn = isSignedIn
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
