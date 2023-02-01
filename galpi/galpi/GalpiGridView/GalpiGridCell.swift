//
//  GalpiGridCell.swift
//  galpi
//
//  Created by minsson on 2023/01/31.
//

import SwiftUI

struct GalpiGridCellView: View {
    
    let galpi: Galpi

    var body: some View {
        VStack(spacing: 0) {
            Image(galpi.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 150, maxHeight: 200, alignment: .bottom)
            
            Rectangle()
                .frame(width: 180, height: 1)
                .foregroundColor(.gray)
        }
    }
}

struct GalpiGridCell_Previews: PreviewProvider {
    
    static let galpi = dummyGalpis[0]
    
    static var previews: some View {
        GalpiGridCellView(galpi: galpi)
    }
}
