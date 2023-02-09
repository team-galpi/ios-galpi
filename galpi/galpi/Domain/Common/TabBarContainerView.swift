//
//  TabBarContainerView.swift
//  galpi
//
//  Created by minsson on 2023/02/09.
//

import SwiftUI

struct TabBarContainerView: View {
    
    @State private var selectionTagIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectionTagIndex) {
            GalpiGridView()
                .tabItem {
                    Text("GALPI")
                }
                .tag(0)
            
            // TODO: MYPAGE 구현 후 연결하기
            Color.cyan
                .tabItem {
                    Text("MYPAGE")
                }
                .tag(1)
        }
    }
    
}

struct TabBarContainerView_Previews: PreviewProvider {
    
    static var previews: some View {
        TabBarContainerView()
    }
    
}
