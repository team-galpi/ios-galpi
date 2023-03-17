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
    case custom(String)
    
    var code: String {
        switch self {
        case .canceled:
            return "SL100"
        case .internalError:
            return "SL200"
        case .identityToken:
            return "SL300"
        case .idTokenString:
            return "SL400"
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
        case .identityToken:
            return "identity token의 fetch 실패"
        case .idTokenString:
            return "data를 token string으로 직렬화하는 것 실패"
        case .custom(let customFailureReason):
            return customFailureReason
        }
    }
    
}
