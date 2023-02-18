//
//  ServerLoginManagerInterface.swift
//  galpi
//
//  Created by minsson on 2023/02/18.
//

import Foundation

protocol ServerLoginManagerInterface {
    
    var shouldSignIn: Bool { get }
    func signIn(with concreteSocialLoginManager: SocialLoginManagerInterface, completion: @escaping (Result<Bool, Error>) -> Void)
    
}
