//
//  SocialLogin.swift
//  galpi
//
//  Created by minsson on 2023/02/19.
//

enum SocialLogin {

    case apple
    
    var loginManager: SocialLoginManagerProtocol {
        switch self {
        case .apple:
            return AppleLoginManager()
        }
    }
    
}
