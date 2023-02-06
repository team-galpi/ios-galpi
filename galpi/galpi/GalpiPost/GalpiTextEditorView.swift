//
//  GalpiTextEditorView.swift
//  galpi
//
//  Created by Ellen J on 2023/02/05.
//

import SwiftUI

struct GalpiTextEditorView: View {
    @Environment(\.dismiss) private var dismiss
    var title: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .padding(EdgeInsets(top: 30, leading: 30, bottom: 0, trailing: 0))
                        .font(.title3)
                        .fontWeight(.thin)
                        .foregroundColor(
                            Color(uiColor: UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 1)))
                }
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                        .foregroundColor(Color(uiColor: UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 1)))
                        .fontWeight(.light)
                }
                .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 20))
                
            }
            
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
                .padding(EdgeInsets(top: 30, leading: 30, bottom: 0, trailing: 30))
            
            TextEditor(text: $text)
                    .padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30))
                    .foregroundColor(Color(UIColor(red: 88/255, green: 88/255, blue: 88/255, alpha: 1)))
            Spacer()
        }
    }
}
