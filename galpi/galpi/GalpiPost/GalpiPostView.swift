//
//  GalpiPostView.swift
//  galpi
//
//  Created by Ellen J on 2023/01/31.
//

import SwiftUI

enum AppConstraints {
    static let horizentalSpacing: CGFloat = 40
    static let width = UIScreen.main.bounds.width - horizentalSpacing
    static let height = UIScreen.main.bounds.height
    static let tripartitionWidth = width / 3
}

struct GalpiPostView: View {
    @State var title = ""
    @State var date = ""
    @State var author = ""
    @State var publisher = ""
    @State var quotes = ""
    @State var opinion = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Spacer(minLength: 10)
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "xmark")
                            .padding(20)
                            .font(.title3)
                            .fontWeight(.thin)
                            .foregroundColor(Color(uiColor: UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 1)))
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Done")
                            .foregroundColor(Color(uiColor: UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 1)))
                            .fontWeight(.light)
                    }
                    .padding(30)
                    
                }
                
                Spacer(minLength: 40)
                HStack {
                    Spacer(minLength: 20)
                    FieldView(
                        title: "title",
                        lineLimit: 2,
                        width: AppConstraints.width
                        - AppConstraints.tripartitionWidth,
                        alinement: .leading,
                        label: $title
                    )
                    FieldView(
                        title: "date",
                        lineLimit: 2,
                        width: AppConstraints.tripartitionWidth,
                        alinement: .leading,
                        label: $date
                    )
                    Spacer(minLength: 20)
                }
                
                HStack {
                    Spacer(minLength: 20)
                    FieldView(
                        title: "author",
                        lineLimit: 2,
                        width: AppConstraints.width
                        - AppConstraints.tripartitionWidth,
                        alinement: .leading,
                        label: $author
                    )
                    FieldView(
                        title: "publisher",
                        lineLimit: 2,
                        width: AppConstraints.tripartitionWidth,
                        alinement: .leading,
                        label: $publisher
                    )
                    Spacer(minLength: 20)
                }
                
                Spacer(minLength: 50)
                
                HStack {
                    Spacer(minLength: 20)
                    VStack(alignment: .leading) {
                        Text("quotes")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        TextEditor(text: $quotes)
                            .lineLimit(3)
                            .frame(minHeight: 30)
                        
                        if quotes.isEmpty {
                            Rectangle()
                                .frame(width: AppConstraints.width, height: 1, alignment: .center)
                                .foregroundColor(Color(UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)))
                        } else {
                            Rectangle()
                                .frame(width: AppConstraints.width, height: 1, alignment: .center)
                                .foregroundColor(.clear)
                        }
                    }
                    Spacer(minLength: 20)
                }
                
                Spacer(minLength: 50)
                
                HStack {
                    Spacer(minLength: 20)
                    
                    VStack(alignment: .leading) {
                        Text("opnion")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        TextEditor(text: $opinion)
                            .lineLimit(0)
                            .frame(minHeight: 30)
                        if opinion.isEmpty {
                            TextLineView()
                        }
                    }
                    Spacer(minLength: 20)
                }
            }
        }
    }
}

struct GalpiPostView_Previews: PreviewProvider {
    static var previews: some View {
        GalpiPostView()
    }
}
