//
//  CustomTextField.swift
//  write
//
//  Created by Shivam Vijaywargiya on 12/07/20.
//

import SwiftUI
import WebKit

struct CustomTextEditor: UIViewRepresentable {
    @ObservedObject var editorController: EditorController
    
    class Coordinator: NSObject, UITextViewDelegate {
        
        @ObservedObject var editorController: EditorController
        var didBecomeFirstResponder = false
        
        init(controller: ObservedObject<EditorController>) {
            _editorController = controller
        }
        
        func textViewDidChangeSelection(_ textView: UITextView) {
            editorController.text = textView.text
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            editorController.isActive = true
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            editorController.isActive = false
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(controller: _editorController)
    }
    
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView(frame: .zero)
        view.delegate = context.coordinator
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.backgroundColor = UIColor(.clear)
        view.text = editorController.text
        
        let systemFont = UIFont.systemFont(ofSize: 30, weight: .semibold)

        let font: UIFont

        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            font = UIFont(descriptor: descriptor, size: 30)
        } else {
            font = systemFont
        }
        
        view.font = font
        
        let padding = view.textContainer.lineFragmentPadding
        view.textContainerInset =  UIEdgeInsets(top: 0, left: -padding, bottom: 0, right: -padding)
        return view
    }
    

    func updateUIView(_ uiView: UITextView, context: Context) {
//        uiView.text = editorController.text

        if editorController.isActive && !context.coordinator.didBecomeFirstResponder  {
            uiView.becomeFirstResponder()
            context.coordinator.didBecomeFirstResponder = true
        }  else if !editorController.isActive && context.coordinator.didBecomeFirstResponder {
            uiView.resignFirstResponder()
            context.coordinator.didBecomeFirstResponder = false
        }
    }
}
