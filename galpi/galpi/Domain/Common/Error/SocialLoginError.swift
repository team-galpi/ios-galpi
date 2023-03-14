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
    
    var errorReason: String {
        switch self {
        case .canceled:
            return "유저가 인증 절차 취소"
        case .internalError:
            return "유저가 인증 절차를 취소한 것 외의 애플 로그인 기타 에러"
        case .identityToken:
            return "identity token의 fetch 실패"
        case .idTokenString:
            return "data를 token string으로 직렬화하는 것 실패"
        }
    }
    
}
