//
//  StoryScene1.swift
//  SAM
//
//  Created by 077tech on 2023/03/29.
//

import SwiftUI
import SpriteKit

struct StoryScene2: View {
    var scene = GameScene2()
    @State private var useSpriteView = false
    
    
    var body: some View {
        ZStack{
            if useSpriteView {
                SpriteView(scene: scene)
            } else {
                Image("daaanImage")
                    .resizable()
                    .renderingMode(.original)
                //                    .frame(width: 400, height: 775)
                    .ignoresSafeArea()
                HStack{
                    Spacer()
                    VStack{
                        Spacer()
                        Button(action: {
                            self.useSpriteView.toggle()
                        }) {
                            Image(systemName: "arrowshape.right.fill")
                                .resizable()
                                .frame(width: 30, height: 40)
                        }
                        Spacer()
                    }
                    .padding(10)
                    .foregroundColor(.black)
                }
            }
        }
    }
}
