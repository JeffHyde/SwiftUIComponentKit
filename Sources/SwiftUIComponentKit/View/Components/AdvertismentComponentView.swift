//
//  SwiftUIView.swift
//  SwiftUIComponentKit
//
//  Created by Jeff  Hyde on 4/17/25.
//

import SwiftUI

struct AdvertismentComponentView: View {
    @ObservedObject var viewModel: AdvertismentComponentViewModel
    var body: some View {
        HStack(spacing: .zero) {
            if viewModel.imagePlacment == .leading {
                ImageComponent(viewModel: viewModel.imageViewModel)
            }
            VStack(spacing: .zero) {
                TextComponent(viewModel: viewModel.leadingTopTextViewModel)
                TextComponent(viewModel: viewModel.leadingCenterTextViewModel)
                TextComponent(viewModel: viewModel.leadingBottomTextViewModel)
            }
            
            Spacer()
            
            if viewModel.imagePlacment == .center {
                ImageComponent(viewModel: viewModel.imageViewModel)
            }
            
            Spacer()
            
            VStack(spacing: .zero) {
                TextComponent(viewModel: viewModel.trailingTopTextViewModel)
                TextComponent(viewModel: viewModel.trailingCenterTextViewModel)
                TextComponent(viewModel: viewModel.trailingBottomTextViewModel)
            }
            
            if viewModel.imagePlacment == .trailing {
                ImageComponent(viewModel: viewModel.imageViewModel)
            }
        }
        .padding(
            EdgeInsets(
                top: viewModel.innerPadding.top,
                leading: viewModel.innerPadding.leading,
                bottom: viewModel.innerPadding.bottom,
                trailing: viewModel.innerPadding.trailing
            )
        )
        .background {
            RoundedRectangle(cornerRadius: viewModel.cornerRadius)
                .fill(viewModel.backgroundColor)
                .shadow(radius: viewModel.shadowRadius, x: 0, y: viewModel.shadowRadius)
        }
        .overlay {
            RoundedRectangle(cornerRadius: viewModel.cornerRadius)
                .stroke(viewModel.borderColor)
        }
        .padding(
            EdgeInsets(
                top: viewModel.outerPadding.top,
                leading: viewModel.outerPadding.leading,
                bottom: viewModel.outerPadding.bottom,
                trailing: viewModel.outerPadding.trailing
            )
        )
    }
    
    @ViewBuilder
    func TextComponent(viewModel: TextComponentViewModel?) -> some View {
        if let viewModel {
            ComponentView(viewComponent: .text(viewModel: viewModel))
        }
    }
    
    @ViewBuilder
    func ImageComponent(viewModel: ImageComponentViewModel?) -> some View {
        if let viewModel {
            ComponentView(viewComponent: .image(viewModel: viewModel))
        }
    }
}

#Preview {
    AdvertismentComponentView(
        viewModel: AdvertismentComponentViewModel(
            leadingTopTextViewModel: TextComponentViewModel(
                textType: .standard("Product Title"),
                horizontalAlignment: .leading
            ),
            leadingCenterTextViewModel: TextComponentViewModel(
                textType: .standard("Product Subtitle"),
                font: .subheadline,
                horizontalAlignment: .leading
            ),
            leadingBottomTextViewModel: TextComponentViewModel(
                textType: .standard("Product Caption"),
                font: .caption,
                horizontalAlignment: .leading
            ),
            trailingTopTextViewModel: TextComponentViewModel(
                textType: .standard("Promo Text"),
                horizontalAlignment: .trailing
            ),
            trailingCenterTextViewModel: TextComponentViewModel(
                textType: .standard("Promo Subtitle"),
                font: .subheadline,
                horizontalAlignment: .trailing
            ),
            trailingBottomTextViewModel: TextComponentViewModel(
                textType: .standard("Promo Caption"),
                font: .caption,
                horizontalAlignment: .trailing
            ),
            imageViewModel: ImageComponentViewModel(
                type: .system(name: "trash"),
                height: 50,
                outerPadding: .all(.none)
            ),
            imagePlacment: .center,
            backgroundColor: .gray,
            borderColor: .primary,
            borderWidth: .xxSmall,
            cornerRadius: .medium,
            shadowRadius: .xSmall,
            innerPadding: .all(.small),
            outerPadding: .all(.small),
            action: nil
        )
    )
}
