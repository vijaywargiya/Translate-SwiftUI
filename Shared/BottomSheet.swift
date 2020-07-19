//
//  BottomSheet.swift
//  translate
//
//  Created by Shivam Vijaywargiya on 18/07/20.
//

import SwiftUI

struct BottomSheet: View {
    @State var viewState = CGSize.zero
    @StateObject var editorController = EditorController()
    
    let animation = Animation.interpolatingSpring(stiffness: 100, damping: 30, initialVelocity: 10)
    
    var isExpanded: Bool {
        isListeningActive || editorController.isActive
    }
    
    var body: some View {
        ZStack {
            ZStack{
                if isExpanded {
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                self.collapse()
                            }){
                                Image(systemName: "xmark.circle.fill")
                                    .imageScale(.large)
                                    .foregroundColor(Color(.secondaryLabel))
                            }
                        }
                        Spacer()
                    }
                }
                
                if isListeningActive {
                    VStack {
                        HStack {
                            Text("Listening...")
                                .foregroundColor(Color(.secondaryLabel))
                                .font(.system(size: 30, weight: .semibold, design: .rounded))
                            Spacer()
                        }
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .padding(.top, isExpanded ? 20 : 0)

                        Spacer()
                    }
                } else {
                    EditorView(controller: editorController)
                        .padding(.top, isExpanded ? 20 : 0)
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 30)
            .background(Color("background"))
            .cornerRadius(10)
            .onTapGesture {
                self.expand()
            }
            .shadow(color: Color(.black).opacity(self.viewState.height == 0 ? 0 : 0.1), radius: 5)
            .offset(y: offset())
            .zIndex(isExpanded ? 1 : 0)
            .gesture(
                DragGesture().onChanged { value in
                    self.viewState = value.translation
                }
                .onEnded(onDragEnded)
            )
            .animation(animation)
            
            VStack {
                Spacer()
                ZStack{
                    HStack(spacing: 5) {
                        ForEach(0..<50) { index in
                            Bar()
                        }
                    }
                    .opacity(isListeningActive ? 1 : 0)
                    
                    micButton.opacity(isExpanded ? 0 : 1)
                }
            }
            .zIndex(3)
            .padding(.bottom, 70)
            
        }
        
        
    }
    
    
    @State var isListeningActive = false
    
    var micButton: some View {
        Image(systemName: "mic.fill")
            .font(.system(size: 35, weight: .regular, design: .rounded))
            .foregroundColor(Color(.systemGray6))
            .background(
                Circle().fill(Color(.systemTeal))
                    .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            )
            .onTapGesture {
                self.isListeningActive = true
            }
        
    }
    
    func onDragEnded(drag: DragGesture.Value) {
        self.viewState = .zero
        let direction = drag.predictedEndLocation.y - drag.location.y
        
        if direction > 0 && editorController.text == "" {
            self.collapse()
        } else {
            self.expand()
        }
    }
    
    func offset()  -> CGFloat {
        var offset: CGFloat = 0
        if self.isExpanded {
            offset = 0 + self.viewState.height
        } else {
            offset = 500 + self.viewState.height
        }
        
        return offset < 0 ? 0 : offset > 500 ? 500 : offset
    }
    
    func collapse() {
        editorController.isActive = false
        self.isListeningActive = false
    }
    
    func expand() {
        editorController.isActive = true
    }
}


struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet()
    }
}
