//
//  AuthenticationViewModel.swift
//  galpi
//
//  Created by minsson on 2023/02/12.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published private(set) var isSignedIn = false
    @Published var error: GalpiError?
    
    private let serverAuthService: ServerAuthServiceProtocol
    
    init(serverAuthService: ServerAuthServiceProtocol) {
        self.serverAuthService = serverAuthService
        
        isSignedIn = serverAuthService.isSignedIn
    }
    
    func appleLoginButtonTapped() {
        executeServerLogin(with: .apple)
    }
    
    private func executeServerLogin(with socialLogin: SocialLogin) {
        serverAuthService.signIn(with: socialLogin) { boolResult in
            switch boolResult {
            case .success(let isSignedIn):
                self.isSignedIn = isSignedIn
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
