//
//  GalpiError.swift
//  galpi
//
//  Created by minsson on 2023/03/15.
//

import Foundation

enum GalpiError: LocalizedError, GalpiErrorProtocol {
    
    case serverAuthError(ServerAuthError)
    
    var code: String {
        switch self {
        case .serverAuthError(let error):
            return error.code
        }
    }
    
    var errorReason: String {
        switch self {
        case .serverAuthError(let error):
            return error.errorReason
        }
    }
    
}
