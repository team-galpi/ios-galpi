//
//  AppleLoginError.swift
//  galpi
//
//  Created by minsson on 2023/03/14.
//

enum SocialLoginError: GalpiErrorProtocol {
    
    case canceled
    case internalError
    case identityToken
    case idTokenString
    
    var code: String {
        switch self {
        case .canceled:
            return "A100"
        case .internalError:
            return "A200"
        case .identityToken:
            return "A300"
        case .idTokenString:
            return "A400"
        }
    }
    
}
