//
//  ServerAuthError.swift
//  galpi
//
//  Created by minsson on 2023/03/15.
//

enum ServerAuthError: GalpiErrorProtocol {

    case internalError
    case socialLoginError(SocialLoginError)
    
    var code: String {
        switch self {
        case .internalError:
            return "S100"
        case .socialLoginError(let error):
            return error.code
        }
    }
    
    var errorReason: String {
        switch self {
        case .internalError:
            return "Server Auth 내부 에러"
        case .socialLoginError(let error):
            return error.errorReason
        }
    }
    
}
