//
//  GalpiReadTopBarView.swift
//  galpi
//
//  Created by Ellen J on 2023/02/10.
//

import SwiftUI

struct GalpiReadTopBarView<ViewModel>: View where ViewModel: GalpiReadViewModelInterface {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        HStack {
            Button {
                viewModel.input.tapDismissButton()
            } label: {
                Image(systemName: "xmark")
                    .padding(20)
                    .font(.title3)
                    .fontWeight(.thin)
                    .foregroundColor(GDS.AppColor.GrayScale.gray88)
            }
            
            Spacer()
            
            Button {
                viewModel.input.tapEditModeButton()
            } label: {
                Image(systemName: "pencil.tip")
                    .padding(20)
                    .font(.title3)
                    .fontWeight(.thin)
                    .foregroundColor(GDS.AppColor.GrayScale.gray88)
            }
            .fullScreenCover(isPresented: $viewModel.output.isEditModeViewPresented) {
                GalpiPostView(viewModel: GalpiPostViewModel(galpi: viewModel.output.galpi)) { isDismiss in
                }
            }
        }
    }
}
