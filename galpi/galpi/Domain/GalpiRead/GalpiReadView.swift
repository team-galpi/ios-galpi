//
//  GalpiReadView.swift
//  galpi
//
//  Created by Ellen J on 2023/02/10.
//

import SwiftUI

struct GalpiReadView<ViewModel>: View where ViewModel: GalpiReadViewModelInterface {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            GalpiReadTopBarView(viewModel: viewModel)
            
            ScrollView {
                HStack(alignment: .top) {
                    Spacer(minLength: 30)
                    
                    DescriptionView(
                        title: "title",
                        description: viewModel.output.galpi.title,
                        width: AppConstraints.width - AppConstraints.tripartitionWidth - 45
                    )
                    
                    Spacer()
                        .frame(width: 30)
                                        
                    DescriptionView(
                        title: "date",
                        description: viewModel.output.galpi.date.formatDateToString(),
                        width: AppConstraints.tripartitionWidth
                    )
                    
                    Spacer(minLength: 30)
                }
                
                Spacer()
                    .frame(height: 30)
                
                HStack(alignment: .top) {
                    Spacer(minLength: 30)
                    
                    DescriptionView(
                        title: "author",
                        description: viewModel.output.galpi.author,
                        width: AppConstraints.width - AppConstraints.tripartitionWidth - 45
                    )
                    
                    Spacer()
                        .frame(width: 30)
                    
                    DescriptionView(
                        title: "publisher",
                        description: viewModel.output.galpi.publisher,
                        width: AppConstraints.tripartitionWidth
                    )
                    
                    Spacer(minLength: 30)
                }
                
                Spacer()
                    .frame(height: 30)
                
                HStack(alignment: .top) {
                    Spacer(minLength: 30)
                    
                    DescriptionView(
                        title: "quotes",
                        description: viewModel.output.galpi.quotes,
                        width: AppConstraints.width - 15
                    )
                    
                    Spacer(minLength: 30)
                }
                .frame(alignment: .topLeading)
                
                Spacer()
                    .frame(height: 30)
                
                HStack(alignment: .top) {
                    
                    Spacer(minLength: 30)
                    
                    DescriptionView(
                        title: "opinion",
                        description: viewModel.output.galpi.opinion,
                        width: AppConstraints.width - 15
                    )
                    
                    Spacer(minLength: 30)
                }
                .frame(alignment: .topLeading)
                
                Spacer()
                    .frame(height: 30)
            }
        }
    }
    
}
