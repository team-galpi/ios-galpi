//
//  GalpiReadView.swift
//  galpi
//
//  Created by Ellen J on 2023/02/10.
//

import SwiftUI

struct GalpiReadView: View {
    
    @StateObject var viewModel: GalpiReadViewModel
    
    var body: some View {
        
        HStack {
            
            Spacer()
                .frame(width: 30)
            
            VStack {
                
                GalpiReadTopBarView(viewModel: viewModel)
                
                Spacer(minLength: 30)
                
                ScrollView {
                    HStack(alignment: .top) {
                        
                        DescriptionView(
                            title: "title",
                            description: viewModel.galpi.title,
                            width: AppConstraints.width - AppConstraints.tripartitionWidth - 30
                        )
                        
                        Spacer()
                            .frame(width: 30)
                        
                        DescriptionView(
                            title: "date",
                            description: viewModel.galpi.date.formatDateToString(),
                            width: AppConstraints.tripartitionWidth
                        )
                        
                    }
                    
                    Spacer()
                        .frame(height: 30)
                    
                    HStack(alignment: .top) {
                        
                        DescriptionView(
                            title: "author",
                            description: viewModel.galpi.author,
                            width: AppConstraints.width - AppConstraints.tripartitionWidth - 30
                        )
                        
                        Spacer()
                            .frame(width: 30)
                        
                        DescriptionView(
                            title: "publisher",
                            description: viewModel.galpi.publisher,
                            width: AppConstraints.tripartitionWidth
                        )
                        
                    }
                    
                    Spacer()
                        .frame(height: 30)
                    
                    HStack(alignment: .top) {
                        
                        DescriptionView(
                            title: "quotes",
                            description: viewModel.galpi.quotes,
                            width: AppConstraints.width
                        )
                        
                    }
                    .frame(alignment: .topLeading)
                    
                    Spacer()
                        .frame(height: 30)
                    
                    HStack(alignment: .top) {
                        
                        DescriptionView(
                            title: "opinion",
                            description: viewModel.galpi.opinion,
                            width: AppConstraints.width
                        )
                        
                    }
                    .frame(alignment: .topLeading)
                    
                    Spacer()
                        .frame(height: 30)
                }
            }
            
            Spacer()
                .frame(width: 30)
        }
    }
}
