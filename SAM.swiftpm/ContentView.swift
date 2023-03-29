//
//  ContentView.swift
//  SAM
//
//  Created by 7gongong on 2023/03/28.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene = GameScene1()

    let storyScene = StoryScene()
    let pageDataManager = PageDataManager()
    @State var pageIndex = 0
    
    var body: some View {
        TabView {
            OnBoardingPage()
                .tabItem({
                    Image(systemName: "1.circle")
                })
            StoryScenePage(pageData: pageDataManager.pages[pageIndex], buttonActionPrev: {storyScene.prevPage()},
                           buttonActionNext: {storyScene.nextPage()})
                .tabItem({
                    Image(systemName: "1.circle")
                })
            StoryScenePage(pageData: pageDataManager.pages[pageIndex], buttonActionPrev: {storyScene.prevPage()},
                           buttonActionNext: {storyScene.nextPage()})
                .tabItem({
                    Image(systemName: "2.circle")
                })
            StoryScenePage(pageData: pageDataManager.pages[pageIndex], buttonActionPrev: {storyScene.prevPage()},
                           buttonActionNext: {storyScene.nextPage()})
                .tabItem({
                    Image(systemName: "3.circle")
                })
            StoryScenePage(pageData: pageDataManager.pages[pageIndex], buttonActionPrev: {storyScene.prevPage()},
                           buttonActionNext: {storyScene.nextPage()})
                .tabItem({
                    Image(systemName: "4.circle")
                })
        }
    }
}


