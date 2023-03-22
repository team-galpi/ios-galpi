//
//  AppleLoginError.swift
//  galpi
//
//  Created by minsson on 2023/03/14.
//

enum SocialLoginError: GalpiErrorProtocol {
    
    case canceled
    case custom(String)
    
    var code: String {
        switch self {
        case .canceled:
            return "SL100"
        case .custom(_):
            return "SL999"
        }
    }
    
    var failureReason: String? {
        switch self {
        case .canceled:
            return "유저가 소셜 로그인 인증 절차 취소"
        case .custom(let customFailureReason):
            return customFailureReason
        }
    }
    
}
