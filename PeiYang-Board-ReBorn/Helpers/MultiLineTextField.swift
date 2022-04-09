//
//  MultiLineTextField.swift
//  PeiYang-Board-ReBorn
//
//  Created by 李子鸣 on 2022/4/9.
//

import Foundation
import UIKit
import SwiftUI

struct MultilineTextView: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
