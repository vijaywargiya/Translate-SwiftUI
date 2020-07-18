//
//  EditorView.swift
//  translate
//
//  Created by Shivam Vijaywargiya on 18/07/20.
//

import SwiftUI


class EditorController: ObservableObject {
    @Published var isActive: Bool = false
    @Published var text: String = ""
}

struct EditorView: View {
    @ObservedObject var controller: EditorController
    
    var body: some View {
        ZStack {
            CustomTextEditor(editorController: controller)
            
            VStack {
                HStack {
                    Text("Enter text")
                        .foregroundColor(Color(.secondaryLabel))
                        .font(.system(size: 30, weight: .semibold, design: .rounded))
                    Spacer()
                }
                .padding(.leading, 2)
                
                Spacer()
            }.opacity(controller.text == "" ? 1 : 0)
            
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct EditorView_Previews: PreviewProvider {
    static var previews: some View {
        EditorPreview()
    }
    
    struct EditorPreview: View {
        @StateObject var controller = EditorController()
        
        var body: some View {
            EditorView(controller: controller)
        }
    }
}
