//
//  AppleLoginButtonView.swift
//  galpi
//
//  Created by minsson on 2023/02/18.
//

import SwiftUI
import AuthenticationServices

struct AppleLoginButtonView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton()
    }

    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) { }
    
}
