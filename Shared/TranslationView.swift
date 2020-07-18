//
//  TranslationView.swift
//  translate
//
//  Created by Shivam Vijaywargiya on 18/07/20.
//

import SwiftUI


struct screen {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
}

struct TranslationView: View {
    var body: some View {
        VStack(spacing: 20){
            
            VStack {
                HStack{
                    Text("English (US)").font(.system(size: 15, weight: .medium, design: .rounded))
                    Spacer()
                }
                HStack{
                    Text("How are you").font(.system(size: 30, weight: .semibold, design: .rounded))
                    Spacer()
                }
            }
            Divider()
            
            VStack {
                HStack{
                    Text("Spanish").font(.system(size: 15, weight: .medium, design: .rounded))
                    Spacer()
                }
                HStack{
                    Text("Como estas?").font(.system(size: 30, weight: .semibold, design: .rounded))
                    Spacer()
                }
            }.foregroundColor(Color(.systemTeal))
            
            Spacer()
            
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .frame(height: 400)
        .frame(maxWidth: .infinity)
        .background(Color("background"))
        .cornerRadius(10)
    }
}


struct TranslationView_Previews: PreviewProvider {
    static var previews: some View {
        TranslationView()
    }
}
