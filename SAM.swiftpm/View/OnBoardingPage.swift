//
//  SwiftUIView.swift
//  
//
//  Created by 077tech on 2023/03/28.
//

import SwiftUI
import SpriteKit

struct OnBoardingPage: View {
    var scene = GameScene1()
    
    var body: some View {
        NavigationView {
            
            // link to GameScene1
            NavigationLink(
                destination: SpriteView(scene: scene)) {
                    Text("Start the adventure")}
        }
    }
}

