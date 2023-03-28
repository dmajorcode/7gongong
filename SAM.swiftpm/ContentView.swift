//
//  ContentView.swift
//  SAM
//
//  Created by 7gongong on 2023/03/28.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene = GameScene()
    
    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
    }
}
