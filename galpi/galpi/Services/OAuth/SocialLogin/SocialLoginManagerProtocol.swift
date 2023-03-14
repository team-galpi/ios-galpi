//
//  SocialLoginManagerInterface.swift
//  galpi
//
//  Created by minsson on 2023/02/18.
//

import Foundation

protocol SocialLoginManagerProtocol {
    
    var nonce: String { get }
    func signIn(completion: @escaping (Result<SocialLoginCredential, SocialLoginError>) -> Void)
    
}
