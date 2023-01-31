//
//  GalpiGridCell.swift
//  galpi
//
//  Created by minsson on 2023/01/31.
//

import SwiftUI

struct GalpiGridCell: View {

    var body: some View {
        VStack(spacing: 0) {
            Image("test-bookcover")
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
    static var previews: some View {
        GalpiGridCell()
    }
}
