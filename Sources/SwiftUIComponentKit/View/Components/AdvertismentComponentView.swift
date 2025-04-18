//
//  SwiftUIView.swift
//  SwiftUIComponentKit
//
//  Created by Jeff  Hyde on 4/17/25.
//

import SwiftUI

struct AdvertismentComponentView: View {
    var body: some View {
        HStack(spacing: .zero) {
            VStack(spacing: .zero) {
                ComponentView(viewComponent: .text(viewModel: TextComponentViewModel(textType: .standard("Text"))))
                ComponentView(viewComponent: .text(viewModel: TextComponentViewModel(textType: .standard("Text"))))
            }
        }
    }
}

#Preview {
    AdvertismentComponentView()
}
