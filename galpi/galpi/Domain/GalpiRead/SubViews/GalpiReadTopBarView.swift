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
                    .font(.system(size: 15, weight: .thin))
                    .foregroundColor(GDS.AppColor.GrayScale.gray88)
            }
            
            Spacer()
            
            Button {
                viewModel.tapEditModeButton()
            } label: {
                Image(systemName: "pencil.tip")
                    .font(.system(size: 15, weight: .thin))
                    .foregroundColor(GDS.AppColor.GrayScale.gray88)
            }
            .fullScreenCover(
                isPresented: $viewModel.isEditModeViewPresented
            ) {
                GalpiPostView(
                    viewModel: GalpiPostViewModel(
                        galpi: viewModel.galpi,
                        isEditMode: true
                    )
                ) { dismiss in
                    
                }
            }
        }
    }
}
