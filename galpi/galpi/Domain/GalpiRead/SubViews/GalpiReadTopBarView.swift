//
//  GalpiReadTopBarView.swift
//  galpi
//
//  Created by Ellen J on 2023/02/10.
//

import SwiftUI

struct GalpiReadTopBarView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: GalpiReadViewModel
    
    var body: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .padding(20)
                    .font(.title3)
                    .fontWeight(.thin)
                    .foregroundColor(GDS.AppColor.GrayScale.gray88)
            }
            
            Spacer()
            
            Button {
                viewModel.action.tapEditModeButton()
            } label: {
                Image(systemName: "pencil.tip")
                    .padding(20)
                    .font(.title3)
                    .fontWeight(.thin)
                    .foregroundColor(GDS.AppColor.GrayScale.gray88)
            }
            .fullScreenCover(
                isPresented: $viewModel.state.isEditModeViewPresented
            ) {
                GalpiPostView(
                    viewModel: GalpiPostViewModel(
                        galpi: viewModel.state.galpi
                    )) { isDismiss in
                }
            }
        }
    }
}
