//
//  ContentView.swift
//  SAM
//
//  Created by 7gongong on 2023/03/28.
//
// Testing branches

import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene = GameScene1()
    
    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
    }
}
