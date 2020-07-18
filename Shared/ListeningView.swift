//
//  ListeningView.swift
//  translate
//
//  Created by Shivam Vijaywargiya on 18/07/20.
//

import SwiftUI

struct Bar: View {
    
    @State var height: CGFloat
    let animation = Animation.linear.repeatForever(autoreverses: true)
    
    init() {
        _height = State(initialValue:  CGFloat(Int.random(in: 1..<50)))
    }
    
    var body: some View {
        Rectangle().fill(Color(.systemTeal))
            .frame(width: 3, height: height)
            .onAppear {
                withAnimation(animation) {
                    height = CGFloat(Int.random(in: 1..<50))
                }
            }
    }
}
