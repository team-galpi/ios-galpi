//
//  FieldView.swift
//  galpi
//
//  Created by Ellen J on 2023/01/31.
//

import SwiftUI

struct FieldView: View {
    let title: String
    let lineLimit: Int
    let width: CGFloat
    let alinement: HorizontalAlignment
    @Binding var label: String
    @State var isHiddenLine: Bool = false
    
    var body: some View {
        
        VStack(alignment: alinement) {
            Spacer()
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
                .frame(minWidth: width, minHeight: 20, alignment: .topLeading)
                .multilineTextAlignment(.leading)
            TextField(text: $label, axis: .vertical) {
            }
            .foregroundColor(Color(UIColor(red: 88/255, green: 88/255, blue: 88/255, alpha: 1)))
            .lineLimit(lineLimit)
            .frame(minWidth: width - 10, maxHeight: 50)
            .onTapGesture {
                isHiddenLine = true
            }
            if label.isEmpty {
                Rectangle()
                    .frame(width: width - 30, height: 1, alignment: .leading)
                    .foregroundColor(Color(UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)))
            } else {
                Rectangle()
                    .frame(width: width - 30, height: 1, alignment: .leading)
                    .foregroundColor(.clear)
            }
        }
    }
}
