//
//  ContentView.swift
//  Shared
//
//  Created by Shivam Vijaywargiya on 18/07/20.
//

import SwiftUI

struct ContentView: View {
    init(){
        UITabBar.appearance().barTintColor = UIColor(.white)
        UITabBar.appearance().clipsToBounds = true

    }
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "translate").imageScale(.large)
                    Text("Translate")
                }
            
            
            Text("Favourites")
                .tabItem {
                    Image(systemName: "star.fill").imageScale(.large)
                    Text("Favourites")
                }
        }.accentColor(Color(.systemTeal))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
