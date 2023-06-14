//
//  MultilineTextField.swift
//  Zenith Clienteling
//
//  Created by Noy Barak on 26/04/2022.
//
import MaisonKit
import SwiftUI
import UIKit
import StylableSwiftUI

/// A multi-line text editor.
struct MultilineTextField: View {

    private let placeholder: String
    private let minimumHeight: Double

    @Binding private var text: String

    init (_ placeholder: String = "", minimumHeight: Double = 0, text: Binding<String>) {
        self.placeholder = placeholder
        self.minimumHeight = minimumHeight
        self._text = text
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            self.placeholderView
            TextEditor(text: self.$text)
                .padding(.top, 4)
                .frame(minHeight: self.minimumHeight)
        }
        // Remove default padding to match other views
        .padding(.leading, -4)
        .padding(.top, -12)
    }

    @ViewBuilder
    private var placeholderView: some View {
        if self.text.isEmpty {
            Text(verbatim: self.placeholder)
            // Fix to align the placeholder view
                .padding(.leading, 4)
                .padding(.top, 12)
                .disabled(true)
        }
    }
}
