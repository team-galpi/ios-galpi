//
//  GalpiPostView.swift
//  galpi
//
//  Created by Ellen J on 2023/01/31.
//

import SwiftUI

enum AppConstraints {
    
    static let horizontalSpacing: CGFloat = 40
    static let width = UIScreen.main.bounds.width - horizontalSpacing
    static let height = UIScreen.main.bounds.height
    static let tripartitionWidth = width / 3
}

struct GalpiPostView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: GalpiPostViewModel
    @State private var isQuotesPresented: Bool = false
    @State private var isOpinionPresented: Bool = false
    @State private var isDatePickerPresented: Bool = false
    
    var body: some View {
        ZStack(alignment: .center) {
        ScrollView {
                VStack(alignment: .center) {
                    Spacer(minLength: 10)
                    
                    HStack {
                        Button {
                            dismiss()
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
                            alignment: .leading,
                            label: $viewModel.title
                        )
                        
                        VStack(alignment: .leading) {
                            Spacer()
                            Text("date")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .frame(minWidth: AppConstraints.tripartitionWidth, minHeight: 20, alignment: .topLeading)
                                .multilineTextAlignment(.leading)
                            Button {
                                isDatePickerPresented.toggle()
                            } label: {
                                Text(self.formatDateToString(date: viewModel.date))
                                    .frame(alignment: .leading)
                            }
                            .foregroundColor(Color(UIColor(red: 88/255, green: 88/255, blue: 88/255, alpha: 1)))
                            .frame(minWidth: AppConstraints.tripartitionWidth, maxHeight: 50, alignment: .leading)
                        }
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
                            alignment: .leading,
                            label: $viewModel.author
                        )
                        FieldView(
                            title: "publisher",
                            lineLimit: 2,
                            width: AppConstraints.tripartitionWidth,
                            alignment: .leading,
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
                                    self.isQuotesPresented.toggle()
                                } label: {
                                    VStack(alignment: .leading) {
                                        Text(viewModel.quotes)
                                        Rectangle()
                                            .frame(width: AppConstraints.width, height: 25)
                                            .foregroundColor(.clear)
                                    }
                                }
                                .fullScreenCover(isPresented: $isQuotesPresented) {
                                    GalpiTextEditorView(title: "quotes", description: viewModel.quotes) { description in
                                        viewModel.quotes = description
                                    }
                                }
                                TextLineView(numberOfLines: 1)
                            } else {
                                Button {
                                    self.isQuotesPresented.toggle()
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
                                .fullScreenCover(isPresented: $isQuotesPresented) {
                                    GalpiTextEditorView(title: "quotes", description: viewModel.quotes) { description in
                                        viewModel.quotes = description
                                    }
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
                            Spacer(minLength: 40)
                            if viewModel.opinion.isEmpty {
                                Button {
                                    self.isOpinionPresented.toggle()
                                } label: {
                                    VStack {
                                        TextLineView(numberOfLines: 3)
                                    }
                                }
                                .fullScreenCover(isPresented: $isOpinionPresented) {
                                    GalpiTextEditorView(
                                        title: "opinion",
                                        description: viewModel.opinion
                                    ) { description in
                                        viewModel.opinion = description
                                    }
                                }
                            } else {
                                Button {
                                    self.isOpinionPresented.toggle()
                                } label: {
                                    Text(viewModel.opinion)
                                        .foregroundColor(Color(UIColor(red: 88/255, green: 88/255, blue: 88/255, alpha: 1)))
                                        .frame(width: AppConstraints.width, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                }
                                .fullScreenCover(isPresented: $isOpinionPresented) {
                                    GalpiTextEditorView(
                                        title: "opinion",
                                        description: viewModel.opinion
                                    ) { description in
                                        viewModel.opinion = description
                                    }
                                }
                            }
                        }
                        Spacer(minLength: 20)
                    }
                }
            }
            if isDatePickerPresented {
                CalendarView(date: $viewModel.date, isPresented: $isDatePickerPresented)
            }
        }
    }
    
    private func formatDateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter.string(from: date)
    }
    
}
