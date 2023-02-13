//
//  DescriptionView.swift
//  galpi
//
//  Created by Ellen J on 2023/02/13.
//

import SwiftUI

struct DescriptionView: View {
    let title: String
    let description: String
    let width: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(Font.jejuMyeongjo(size: 15))
                .foregroundColor(GDS.AppColor.GrayScale.gray205)
                .frame(alignment: .topLeading)
            
            Spacer()
                .frame(height: 8)
            
            Text(description)
                .font(Font.jejuMyeongjo(size: 15))
                .foregroundColor(GDS.AppColor.GrayScale.gray34)
                .frame(alignment: .topLeading)
                .lineSpacing(10)
        }
        .frame(width: width, alignment: .topLeading)
    }
}
