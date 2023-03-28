//
//  ContentView.swift
//  SAM
//
//  Created by 7gongong on 2023/03/28.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.black
    }
    
    var body: some View {
        TabView {
            OnBoardingPage()
                .tabItem({
                    Image(systemName: "1.circle")
                })
            
            StoryScene1()
                .tabItem({
                    Image(systemName: "2.circle")
                })
            
            StoryScene2()
                .tabItem({
                    Image(systemName: "3.circle")
                })
            
            StoryScene3()
                .tabItem({
                    Image(systemName: "4.circle")
                })
            
            StoryScene4()
                .tabItem({
                    Image(systemName: "5.circle")
                })
        }
    }
}
