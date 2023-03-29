//
//  StoryScene3.swift
//  SAM
//
//  Created by 077tech on 2023/03/29.
//

import SwiftUI
import SpriteKit

struct StoryScene3: View {
    var scene = GameScene4()
    @State private var useSpriteView = false
    
    
    var body: some View {
        ZStack{
            if useSpriteView {
                SpriteView(scene: scene).ignoresSafeArea()
            } else {
                Image("daaanImage1")
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
