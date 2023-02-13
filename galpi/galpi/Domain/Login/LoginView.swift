//
//  LoginView.swift
//  galpi
//
//  Created by minsson on 2023/02/12.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    // TODO: viewModel 주입
    let viewModel = AuthenticationViewModel()
    
    var body: some View {
        signInWithAppleButton()
            .frame(width: 240, height: 50)
    }
    
}

extension LoginView {
    
    private func signInWithAppleButton() -> some View {
        SignInWithAppleButton(.signIn) { request in
            viewModel.handleSignInWithAppleRequest(request)
        } onCompletion: { result in
            viewModel.handleSignInWithAppleCompletion(result)
        }
        .signInWithAppleButtonStyle(colorScheme == .light ? .black : .white)
        .frame(maxWidth: .infinity, minHeight: 50)
    }
    
}

struct LoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginView()
    }
    
}
