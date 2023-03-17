//
//  AppleLoginError.swift
//  galpi
//
//  Created by minsson on 2023/03/14.
//

enum SocialLoginError: GalpiErrorProtocol {
    
    case canceled
    case internalError
    case custom(String)
    
    var code: String {
        switch self {
        case .canceled:
            return "SL100"
        case .internalError:
            return "SL200"
        case .custom(_):
            return "SL999"
        }
    }
    
    var failureReason: String? {
        switch self {
        case .canceled:
            return "유저가 인증 절차 취소"
        case .internalError:
            return "유저가 인증 절차를 취소한 것 외의 애플 로그인 기타 에러"
        case .custom(let customFailureReason):
            return customFailureReason
        }
    }
    
}
