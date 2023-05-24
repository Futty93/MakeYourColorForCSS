//
//  ContentView.swift
//  slider
//
//  Created by 二渡和輝 on 2020/03/05.
//  Copyright © 2020 二渡和輝. All rights reserved.
//

import SwiftUI

var screenWidth: CGFloat = UIScreen.main.bounds.width

struct ContentView: View {
    
    @State var red = Double(Int.random(in: 0...15)) * 17
    @State var green = Double(Int.random(in: 0...15)) * 17
    @State var blue = Double(Int.random(in: 0...15)) * 17
    
    var body: some View {
        
        TabView {
            
            mainView(red: $red, green: $green, blue: $blue)
                .tag(1)
                .tabItem{
                    
                    VStack {
                        
                        Image(systemName: "house")
                        
                        Text("Home")
                        
                    }
            }
            
            favoriteView(red: $red, green: $green, blue: $blue)
                .tag(2)
                .tabItem{
                    
                    VStack{
                        
                        Image(systemName: "star.fill")
                        
                        Text("Favorite")
                        
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
