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
        VStack(alignment: .leading, spacing: 20){
            VStack(alignment: .leading) {
                Text("English (US)").font(.system(size: 15, weight: .medium, design: .rounded))
                Text("How are you").font(.system(size: 30, weight: .semibold, design: .rounded))
            }
            
            Divider()
            
            VStack(alignment: .leading) {
                Text("Spanish").font(.system(size: 15, weight: .medium, design: .rounded))
                Text("Como estas?").font(.system(size: 30, weight: .semibold, design: .rounded))
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
