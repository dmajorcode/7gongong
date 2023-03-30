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
    ZStack{
            if useSpriteView {
                SpriteView(scene: scene).ignoresSafeArea()
            } else {
                Image("daaanImage1")
                    .resizable()
//                    .frame(width: 400, height: 775)
                    .renderingMode(.original)
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

