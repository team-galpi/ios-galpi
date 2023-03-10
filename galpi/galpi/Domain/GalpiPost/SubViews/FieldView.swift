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
    let alignment: HorizontalAlignment
    @Binding var label: String
    @State private var isHiddenLine: Bool = false
    
    var body: some View {
        
        VStack(alignment: alignment) {
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
            Rectangle()
                .frame(width: width - 30, height: 1, alignment: .leading)
                .foregroundColor(label.isEmpty ? Color(UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)) : .clear)
        }
    }
    
}
