//
//  ServerAuthError.swift
//  galpi
//
//  Created by minsson on 2023/03/15.
//

enum ServerAuthError: GalpiErrorProtocol {

    case socialLoginError(SocialLoginError)
    case custom(String)
    
    var code: String {
        switch self {
        case .socialLoginError(let error):
            return error.code
        case .custom:
            return "SA999"
        }
    }
    
    var failureReason: String? {
        switch self {
        case .socialLoginError(let error):
            return error.failureReason
        case .custom(let customFailureReason):
            return customFailureReason
        }
    }
    
}
