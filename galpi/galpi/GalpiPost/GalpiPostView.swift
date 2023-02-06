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
    @StateObject var viewModel: GalpiPostViewModel
    @State var isQuotesPresented: Bool = false
    @State var isOpinionPresented: Bool = false
    
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
                            .foregroundColor(
                                Color(uiColor: UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 1)))
                    }
                    Spacer()
                    Button {
                        viewModel.createGalpi()
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
                        label: $viewModel.title
                    )
                    FieldView(
                        title: "date",
                        lineLimit: 2,
                        width: AppConstraints.tripartitionWidth,
                        alinement: .leading,
                        label: $viewModel.date
                    )
                    Spacer(minLength: 20)
                }
                
                Spacer(minLength: 10)
                
                HStack {
                    Spacer(minLength: 20)
                    FieldView(
                        title: "author",
                        lineLimit: 2,
                        width: AppConstraints.width
                        - AppConstraints.tripartitionWidth,
                        alinement: .leading,
                        label: $viewModel.author
                    )
                    FieldView(
                        title: "publisher",
                        lineLimit: 2,
                        width: AppConstraints.tripartitionWidth,
                        alinement: .leading,
                        label: $viewModel.publisher
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
                        if viewModel.quotes.isEmpty {
                            Button {
                                self.quotesIsPresented.toggle()
                            } label: {
                                VStack(alignment: .leading) {
                                    Text(viewModel.quotes)
                                    Rectangle()
                                        .frame(width: AppConstraints.width, height: 25)
                                        .foregroundColor(.clear)
                                }
                            }
                            .fullScreenCover(isPresented: $quotesIsPresented) {
                                GalpiTextEditorView(title: "quotes", text: $viewModel.quotes)
                            }
                            Rectangle()
                                .frame(width: AppConstraints.width, height: 1, alignment: .center)
                                .foregroundColor(Color(UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)))
                        } else {
                            Button {
                                self.quotesIsPresented.toggle()
                            } label: {
                                VStack {
                                    Rectangle()
                                        .frame(width: AppConstraints.width, height: 5)
                                        .foregroundColor(.clear)
                                    Text(viewModel.quotes)
                                        .frame(width: AppConstraints.width, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color(UIColor(red: 88/255, green: 88/255, blue: 88/255, alpha: 1)))
                                }
                            }
                            .fullScreenCover(isPresented: $quotesIsPresented) {
                                GalpiTextEditorView(title: "quotes", text: $viewModel.quotes)
                            }
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
                        Text("opinion")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer(minLength: 30)
                        if viewModel.opinion.isEmpty {
                            Button {
                                self.opinionIsPresented.toggle()
                            } label: {
                                VStack {
                                    TextLineView()
                                }
                            }
                            .fullScreenCover(isPresented: $opinionIsPresented) {
                                GalpiTextEditorView(title: "opinion", text: $viewModel.opinion)
                            }
                        } else {
                            Button {
                                self.opinionIsPresented.toggle()
                            } label: {
                                Text(viewModel.opinion)
                                    .foregroundColor(Color(UIColor(red: 88/255, green: 88/255, blue: 88/255, alpha: 1)))
                                    .frame(width: AppConstraints.width, alignment: .leading)
                                    .multilineTextAlignment(.leading)
                            }
                            .fullScreenCover(isPresented: $opinionIsPresented) {
                                GalpiTextEditorView(title: "opinion", text: $viewModel.opinion)
                            }
                        }
                    }
                    Spacer(minLength: 20)
                }
            }
        }
    }
    
    func formatDateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter.string(from: date)
    }
}
