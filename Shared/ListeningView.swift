//
//  ListeningView.swift
//  translate
//
//  Created by Shivam Vijaywargiya on 18/07/20.
//

import SwiftUI

struct Bar: View {
    @State var height: CGFloat
    var heightPostAnimation: CGFloat
    
    let animation = Animation.linear.repeatForever(autoreverses: true)
    
    init() {
        _height = State(initialValue: CGFloat(Int.random(in: 1..<50)))
        heightPostAnimation = CGFloat(Int.random(in: 1..<50))
        
        if abs(height - heightPostAnimation) < 10 {
            heightPostAnimation += 10
        }
    }
    
    var body: some View {
        Rectangle().fill(Color(.systemTeal))
            .frame(width: 3, height: height)
            .onAppear {
                withAnimation(animation) {
                    height = heightPostAnimation
                }
            }
    }
}


struct Bar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            HStack(spacing: 5) {
                ForEach(0..<50) { index in
                    Bar()
                }
            }
        }
        .padding(.bottom, 100)
    }
}
