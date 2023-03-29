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
    @State private var useSpriteView = false
    
    
var body: some View {
       VStack {
           if useSpriteView {
               SpriteView(scene: scene)
           } else {
               Text("Regular View")
               Button("Toggle") {
                   self.useSpriteView.toggle()
               }
           }
           }
       }
}

