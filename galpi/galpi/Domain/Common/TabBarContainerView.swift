//
//  TabBarContainerView.swift
//  galpi
//
//  Created by minsson on 2023/02/09.
//

import SwiftUI

struct TabBarContainerView: View {
    
    @State private var selectedTagIndex: Int = 0
    
    init() {
        UITabBar.appearance().backgroundColor = .black
    }
    
    var body: some View {
        TabView(selection: $selectedTagIndex) {
            GalpiGridView()
                .tabItem {
                    Text("GALPI")
                }
                .toolbarBackground(.black, for: .tabBar)
                .tag(0)
            
            // TODO: MYPAGE 구현 후 연결하기
            Color.cyan
                .tabItem {
                    Text("MYPAGE")
                }
                .toolbarBackground(.black, for: .tabBar)
                .tag(1)
        }
        .accentColor(.white)
    }
    
}

struct TabBarContainerView_Previews: PreviewProvider {
    
    static var previews: some View {
        TabBarContainerView()
    }
    
}
