//
//  GalpiGridView.swift
//  galpi
//
//  Created by minsson on 2023/01/31.
//

import SwiftUI

struct GalpiGridView: View {
    
    let gridColumn: [GridItem] = [GridItem(.adaptive(minimum: 140), spacing: 0)]
    
    @State private var selectedGalpi = Galpi(title: "", image: "", date: Date.now, author: "", publisher: "", quotes: "", opinion: "")
    @State private var shouldPresentGalpiReadView = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridColumn, spacing: 37) {
                    ForEach(dummyGalpis, id: \.self) { galpi in
                        NavigationLink(value: galpi)  {
                            GalpiGridCellView(galpi: galpi)
                        }
                        .navigationDestination(for: Galpi.self) { galpi in
                            VStack {
                                // TODO: 작성해놓은 갈피를 조회할 수 있는 GalpiReadView 띄우기
                                Text(galpi.title)
                                Image(galpi.image)
                            }
                        }
                    }
                }
            }
            .padding(EdgeInsets(top: 78, leading: 20, bottom: 0, trailing: 20))

private extension GalpiGridView {
    
    func GalpiAddButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.4), radius: 3, x: 4, y: 4)
    
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
    }
    
}

struct GalpiGridView_Previews: PreviewProvider {
    static var previews: some View {
        GalpiGridView()
    }
}
