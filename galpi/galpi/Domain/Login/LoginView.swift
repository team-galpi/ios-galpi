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
    let viewModel = LoginViewModel()
    
    var body: some View {
        AppleLoginButtonView()
            .frame(width: 240, height: 50)
            .onTapGesture {
                viewModel.appleLoginButtonTapped()
            }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginView()
    }
    
}
