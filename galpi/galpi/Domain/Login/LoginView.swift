//
//  LoginView.swift
//  galpi
//
//  Created by minsson on 2023/02/12.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
        
    @StateObject var viewModel: LoginViewModel
    
    var body: some View {
        if viewModel.shouldSignIn {
            VStack {
                Spacer()
                
                Text("galpi:")
                    .font(.system(size:65, design: .serif))
                    .padding(.bottom, 130)
                
                Spacer()
                    
                AppleLoginButtonView()
                    .frame(width: 240, height: 50)
                    .onTapGesture {
                        viewModel.appleLoginButtonTapped()
                    }
                    .padding(.bottom, 90)
            }
        } else {
            TabBarContainerView()
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    
    static let loginViewModel = LoginViewModel(serverLoginManager: FirebaseLoginManager())
    
    static var previews: some View {
        LoginView(viewModel: loginViewModel)
    }
    
}

fileprivate struct AppleLoginButtonView: UIViewRepresentable {
    
    @Environment(\.colorScheme) var colorScheme
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        let appleLoginButton = ASAuthorizationAppleIDButton(
            authorizationButtonType: .signIn,
            authorizationButtonStyle: colorScheme == .dark ? .white : .black
        )
        
        return appleLoginButton
    }

    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) { }
    
}
