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
        HStack {
            ScrollView {
                LazyVGrid(columns: gridColumn, spacing: 37) {
                    ForEach(dummyGalpis, id: \.self) { galpi in
                        GalpiGridCellView(galpi: galpi)
                            .onTapGesture {
                                selectedGalpi = galpi
                                shouldPresentGalpiReadView.toggle()
                            }
                            .fullScreenCover(isPresented: $shouldPresentGalpiReadView) {
                                Button {
                                    shouldPresentGalpiReadView.toggle()
                                } label: {
                                    // TODO: GalpiReadView에 galpi 전달하여 열기
                                }
                            }
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 78, leading: 20, bottom: 0, trailing: 20))
    }
}

struct GalpiGridView_Previews: PreviewProvider {
    static var previews: some View {
        GalpiGridView()
    }
}
