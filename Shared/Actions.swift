//
//  Actions.swift
//  translate
//
//  Created by Shivam Vijaywargiya on 18/07/20.
//

import SwiftUI

struct Actions: View {
    @State var isPresented: Bool = false
    
    var body: some View {
        HStack{
            Button(action: {
                isPresented = true
            }){
                VStack{
                    Text("English").font(.body)
                    Text("US").font(.caption).foregroundColor(.secondary)
                }
                .foregroundColor(Color(.label))
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 50)
                .background(Color("background"))
                .cornerRadius(10)
            }
            
            Button(action: {
                isPresented = true
            }){
                VStack{
                    Text("Spanish").font(.body)
                }
                .foregroundColor(Color(.label))
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 50)
                .background(Color("background"))
                .cornerRadius(10)
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .sheet(isPresented: $isPresented) {
            Text("Sheet")
        }
    }
}

struct Actions_Previews: PreviewProvider {
    static var previews: some View {
        Actions()
    }
}
