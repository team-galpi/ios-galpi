//
//  ServerLoginManagerInterface.swift
//  galpi
//
//  Created by minsson on 2023/02/18.
//

import Foundation

protocol ServerLoginManagerProtocol {
    
    var shouldSignIn: Bool { get }
    func signIn(with socialLogin: SocialLogin, completion: @escaping (Result<Bool, Error>) -> Void)
    
}
