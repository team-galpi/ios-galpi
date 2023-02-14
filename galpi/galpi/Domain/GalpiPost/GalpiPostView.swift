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

struct GalpiPostView<ViewModel>: View where ViewModel: GalpiPostViewModelInterface {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: ViewModel
    @State private var isQuotesPresented: Bool = false
    @State private var isOpinionPresented: Bool = false
    @State private var isDatePickerPresented: Bool = false
    let completion: (Bool) -> Void
    
    var body: some View {
        ZStack(alignment: .center) {
        ScrollView {
                VStack(alignment: .center) {
                    Spacer(minLength: 10)
                    
                    HStack {
                        Button {
                            completion(false)
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
                            completion(false)
                            viewModel.tapDoneButton()
                            dismiss()
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
                            label: $viewModel.galpi.title
                        )
                        
                        VStack(alignment: .leading) {
                            Spacer()
                            Text("date")
                                .font(.jejuMyeongjo(size: 15))
                                .foregroundColor(GDS.AppColor.GrayScale.gray205)
                                .frame(minWidth: AppConstraints.tripartitionWidth, minHeight: 20, alignment: .topLeading)
                                .multilineTextAlignment(.leading)
                            Button {
                                isDatePickerPresented.toggle()
                            } label: {
                                Text(viewModel.galpi.date.formatDateToString())
                                    .frame(alignment: .leading)
                                    .font(.jejuMyeongjo(size: 15))
                                    .foregroundColor(GDS.AppColor.GrayScale.gray34)
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
                            label: $viewModel.galpi.author
                        )
                        FieldView(
                            title: "publisher",
                            lineLimit: 2,
                            width: AppConstraints.tripartitionWidth,
                            alignment: .leading,
                            label: $viewModel.galpi.publisher
                        )
                        Spacer(minLength: 20)
                    }
                    Spacer(minLength: 50)
                    
                    HStack {
                        Spacer(minLength: 20)
                        VStack(alignment: .leading) {
                            Text("quotes")
                                .font(.jejuMyeongjo(size: 15))
                                .foregroundColor(GDS.AppColor.GrayScale.gray205)
                            if viewModel.galpi.quotes.isEmpty {
                                Button {
                                    self.isQuotesPresented.toggle()
                                } label: {
                                    VStack(alignment: .leading) {
                                        Text(viewModel.galpi.quotes)
                                            .font(.jejuMyeongjo(size: 15))
                                            .foregroundColor(GDS.AppColor.GrayScale.gray34)
                                        Rectangle()
                                            .frame(width: AppConstraints.width, height: 25)
                                            .foregroundColor(.clear)
                                    }
                                }
                                .fullScreenCover(isPresented: $isQuotesPresented) {
                                    GalpiTextEditorView(title: "quotes", description: viewModel.galpi.quotes) { description in
                                        viewModel.galpi.quotes = description
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
                                        Text(viewModel.galpi.quotes)
                                            .font(.jejuMyeongjo(size: 15))
                                            .frame(width: AppConstraints.width, alignment: .leading)
                                            .multilineTextAlignment(.leading)
                                            .foregroundColor(GDS.AppColor.GrayScale.gray34)
                                    }
                                }
                                .fullScreenCover(isPresented: $isQuotesPresented) {
                                    GalpiTextEditorView(title: "quotes", description: viewModel.galpi.quotes) { description in
                                        viewModel.galpi.quotes = description
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
                                .font(.jejuMyeongjo(size: 15))
                                .foregroundColor(GDS.AppColor.GrayScale.gray205)
                            Spacer(minLength: 40)
                            if viewModel.galpi.opinion.isEmpty {
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
                                        description: viewModel.galpi.opinion
                                    ) { description in
                                        viewModel.galpi.opinion = description
                                    }
                                }
                            } else {
                                Button {
                                    self.isOpinionPresented.toggle()
                                } label: {
                                    Text(viewModel.galpi.opinion)
                                        .font(.jejuMyeongjo(size: 15))
                                        .foregroundColor(GDS.AppColor.GrayScale.gray34)
                                        .frame(width: AppConstraints.width, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                }
                                .fullScreenCover(isPresented: $isOpinionPresented) {
                                    GalpiTextEditorView(
                                        title: "opinion",
                                        description: viewModel.galpi.opinion
                                    ) { description in
                                        viewModel.galpi.opinion = description
                                    }
                                }
                            }
                        }
                        Spacer(minLength: 20)
                    }
                }
            }
            if isDatePickerPresented {
                CalendarView(date: $viewModel.galpi.date, isPresented: $isDatePickerPresented)
            }
        }
    }
    
}
