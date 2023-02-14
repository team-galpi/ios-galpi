//
//  GalpiGridView.swift
//  galpi
//
//  Created by minsson on 2023/01/31.
//

import SwiftUI

struct GalpiGridView: View {
    
    let gridColumn: [GridItem] = [GridItem(.adaptive(minimum: 140), spacing: 0)]
    
    @State private var selectedGalpi = Galpi()
    @State private var shouldPresentGalpiReadView = false
    @State private var shouldPresentGalpiPostView = false
    @State private var shouldPresentActions = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                galpiGridView()
                    .padding(EdgeInsets(top: 58, leading: 20, bottom: 0, trailing: 20))
                
                if shouldPresentActions {
                    dimmedBackgroundButton()
                }
                
                galpiAddButtonWithActions()
                    .offset(x: 115, y: 300)
            }
        }
    }
    
}

private extension GalpiGridView {
    
    func galpiGridView() -> some View {
        ScrollView {
            LazyVGrid(columns: gridColumn, spacing: 37) {
                ForEach(dummyGalpis, id: \.self) { galpi in
                    NavigationLink(value: galpi)  {
                        GalpiGridCellView(galpi: galpi)
                    }
                    .navigationDestination(for: Galpi.self) { galpi in
                        VStack {
                            GalpiReadView(viewModel: GalpiReadViewModel(galpi: galpi))
                        }
                    }
                }
            }
        }
        
    }
    
}

private extension GalpiGridView {
    
    func galpiAddButtonWithActions() -> some View {
        galpiAddButton {
            shouldPresentActions.toggle()
        }
        .overlay(alignment: .trailing) {
            if shouldPresentActions {
                actionPickerMenu()
                    .offset(y: -100)
            }
        }
    }
    
    func actionPickerMenu() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .shadow(color: .black.opacity(0.4), radius: 3, x: 3, y: 3)
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 16) {
                Button("책 검색하기") {
                    shouldPresentActions.toggle()
                    // TODO: 책 검색하기 뷰 띄우기
                }
                
                Button("직접 입력하기") {
                    shouldPresentGalpiPostView.toggle()
                }
                .fullScreenCover(isPresented: $shouldPresentGalpiPostView) {
                    GalpiPostView(viewModel: GalpiPostViewModel()) { completion in
                        shouldPresentActions = completion
                    }
                }
            }
            .frame(width: 140, height: 100)
            .foregroundColor(.black)
            .padding(.trailing, 4)
        }
    }
    
    func galpiAddButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.4), radius: 3, x: 3, y: 3)
                
                plusSymbol()
            }
            .frame(width: 60, height: 60)
        }
    }

    func plusSymbol() -> some View {
        ZStack {
            Rectangle()
                .frame(width: 25, height: 1)
            
            Rectangle()
                .frame(width: 1, height: 25)
        }
        .foregroundColor(.black)
        .rotationEffect(.degrees(shouldPresentActions ? 45 : 0))
        .animation(Animation.easeOut(duration: 0.15), value: shouldPresentActions)
    }
    
    func dimmedBackgroundButton() -> some View {
        Button {
            shouldPresentActions.toggle()
        } label: {
            Rectangle()
                .foregroundColor(Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.24)))
                .ignoresSafeArea()
        }
    }
    
}

struct GalpiGridView_Previews: PreviewProvider {
    
    static var previews: some View {
        GalpiGridView()
    }
    
}
