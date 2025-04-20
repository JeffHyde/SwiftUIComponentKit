//
//  Test.swift
//  SwiftUIComponentKit
//
//  Created by Jeff  Hyde on 4/20/25.
//

import Testing
@testable import SwiftUIComponentKit

struct TextFieldComponentTests {
    @Test func init_with_default() async throws {
        let text = "Hello World!"
        let viewModel = TextFieldComponentViewModel(text: text)
        
        #expect(viewModel.text == text)
        #expect(viewModel.localizedPlaceHolder == "")
        #expect(viewModel.font == .body)
        #expect(viewModel.horizontalAlignment == nil)
        #expect(viewModel.foregroundColor == .primary)
        #expect(viewModel.backgroundColor == .clear)
        #expect(viewModel.borderColor == .clear)
        #expect(viewModel.borderWidth == .none)
        #expect(viewModel.cornerRadius == .none)
        #expect(viewModel.innerPadding.top == .none)
        #expect(viewModel.innerPadding.bottom == .none)
        #expect(viewModel.innerPadding.leading == .none)
        #expect(viewModel.innerPadding.trailing == .none)
        #expect(viewModel.outerPadding.top == .none)
        #expect(viewModel.outerPadding.bottom == .none)
        #expect(viewModel.outerPadding.leading == .none)
        #expect(viewModel.outerPadding.trailing == .none)
        #expect(viewModel.autocorrectionDisabled == true)
        #expect(viewModel.textInputAutocapitalization == .sentences)
        #expect(viewModel.keyboardType == .default)
        #expect(viewModel.submitLabel == .done)
        #expect(viewModel.isSecure == false)
    }
}
