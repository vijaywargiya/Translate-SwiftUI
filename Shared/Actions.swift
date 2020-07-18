//
//  Actions.swift
//  translate
//
//  Created by Shivam Vijaywargiya on 18/07/20.
//

import SwiftUI

struct Actions: View {
    var body: some View {
        HStack{
            from
            to
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    
    var from: some View {
        VStack{
            Text("English").font(.body)
            Text("US").font(.caption).foregroundColor(.secondary)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 50)
        .background(Color("background"))
        .cornerRadius(10)
    }
    
    var to: some View{
        Text("Spanish")
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 50)
            .background(Color("background"))
            .cornerRadius(10)
    }
}

struct Actions_Previews: PreviewProvider {
    static var previews: some View {
        Actions()
    }
}
